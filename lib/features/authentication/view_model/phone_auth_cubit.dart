import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../resources/constants_manager.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: AppConstant.otpTimeout),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed');
    emit(PhoneAuthError(errorMsg: error.code));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneAuthNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneAuthOTPVerified());
    } catch (e) {
      emit(PhoneAuthError(errorMsg: e.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getCurrentUser() {
    return FirebaseAuth.instance.currentUser!;
  }
}
