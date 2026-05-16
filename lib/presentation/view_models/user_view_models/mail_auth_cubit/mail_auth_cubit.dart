import 'package:delivery_app/core/utils/app_enums.dart';
import 'package:delivery_app/core/utils/app_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'mail_auth_state.dart';

class MailAuthCubit extends Cubit<MailAuthStates> {
  MailAuthCubit() : super(MailAuthInitialState());

  static MailAuthCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;


  void signInWithEmailAndPassword(
      {required String email, required String password}) {
    emit(MailAuthSignInLoadingState());

    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      emit(MailAuthSignInSuccessState());
    }).catchError((error) {
      final errorCode = (error as FirebaseAuthException).code;

      emit(MailAuthSignInErrorState(
        error: SignInAuthErrorExtension.fromFirebaseCode(errorCode),
      ));
    });
  }
  void registerWithEmailAndPassword(
      {required String email, required String password}) {
    emit(MailAuthSignUpLoadingState());

    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) async {
      emit(MailAuthSignUpSuccessState());
    }).catchError((error) {
      // استخرج الـ error code من Firebase بشكل نظيف
      final errorCode = (error as FirebaseAuthException).code;

      emit(MailAuthSignUpErrorState(
        error: SignUpAuthErrorExtension.fromFirebaseCode(errorCode),
      ));
    });
  }
}