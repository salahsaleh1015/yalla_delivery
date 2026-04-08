import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'mail_auth_state.dart';

class MailAuthCubit extends Cubit<MailAuthStates> {
  MailAuthCubit() : super(MailAuthInitialState());
  static MailAuthCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // void signInWithEmailAndPassword(
  //     {required String email, required String password}) {
  //   emit(MailAuthSignInLoadingState());
  //
  //   try {
  //     _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((value) async {
  //       emit(MailAuthSignInSuccessState());
  //     }).catchError((error) {
  //       emit(MailAuthSignInErrorState());
  //     });
  //   } catch (e) {
  //     emit(MailAuthSignInErrorState());
  //     print(e.toString());
  //   }
  // }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(MailAuthSignInLoadingState());

    try {
    await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      emit(MailAuthSignInSuccessState());
    }  catch (e) {
      emit(MailAuthSignInErrorState(errorMessage: 'حدث خطأ راجع بياناتك'));
      print(e.toString());
    }
  }

  void registerWithEmailAndPassword(
      {required String email, required String password}) {
    emit(MailAuthSignUpLoadingState());
    try {
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        emit(MailAuthSignUpSuccessState());
      }).catchError((error) {
        emit(MailAuthSignUpErrorState(
          errorMessage: error.toString()
        ));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
