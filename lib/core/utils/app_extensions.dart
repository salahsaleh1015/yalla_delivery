import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:delivery_app/core/utils/app_enums.dart';
import 'package:flutter/material.dart';
extension SignUpAuthErrorExtension on SignUpAuthError {

  // يحول الـ Firebase error code لـ enum value
  static SignUpAuthError fromFirebaseCode(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return SignUpAuthError.emailAlreadyInUse;
      case 'weak-password':
        return SignUpAuthError.weakPassword;
      case 'invalid-email':
        return SignUpAuthError.invalidEmail;
      case 'operation-not-allowed':
        return SignUpAuthError.operationNotAllowed;
      case 'network-request-failed':
        return SignUpAuthError.networkError;
      case 'too-many-requests':
        return SignUpAuthError.tooManyRequests;
      default:
        return SignUpAuthError.unknown;
    }
  }

  // الرسالة المناسبة لكل حالة
  String get arabicMessage {
    switch (this) {
      case SignUpAuthError.emailAlreadyInUse:
        return 'البريد مستخدم بالفعل';
      case SignUpAuthError.weakPassword:
        return 'كلمة المرور ضعيفة جدًا';
      case SignUpAuthError.invalidEmail:
        return 'صيغة البريد غير صحيحة';
      case SignUpAuthError.operationNotAllowed:
        return 'هذه العملية غير مسموح بها';
      case SignUpAuthError.networkError:
        return 'تحقق من اتصالك بالإنترنت';
      case SignUpAuthError.tooManyRequests:
        return 'حاول مرة أخرى لاحقًا';
      case SignUpAuthError.unknown:
        return 'حدث خطأ، حاول مرة أخرى';
    }
  }
}


extension SignInAuthErrorExtension on SignInAuthError {

  static SignInAuthError fromFirebaseCode(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return SignInAuthError.userNotFound;
      case 'wrong-password':
        return SignInAuthError.wrongPassword;
      case 'invalid-email':
        return SignInAuthError.invalidEmail;
      case 'user-disabled':
        return SignInAuthError.userDisabled;
      case 'invalid-credential':
      // Firebase الجديدة بتجمع user-not-found و wrong-password في ده
        return SignInAuthError.invalidCredential;
      case 'network-request-failed':
        return SignInAuthError.networkError;
      case 'too-many-requests':
        return SignInAuthError.tooManyRequests;
      default:
        return SignInAuthError.unknown;
    }
  }

  String get arabicMessage {
    switch (this) {
      case SignInAuthError.userNotFound:
        return 'البريد غير مسجل';
      case SignInAuthError.wrongPassword:
        return 'كلمة المرور غير صحيحة';
      case SignInAuthError.invalidEmail:
        return 'صيغة البريد غير صحيحة';
      case SignInAuthError.userDisabled:
        return 'هذا الحساب موقوف';
      case SignInAuthError.invalidCredential:
        return 'البريد أو كلمة المرور غير صحيحة';
      case SignInAuthError.networkError:
        return 'تحقق من اتصالك بالإنترنت';
      case SignInAuthError.tooManyRequests:
        return 'حاول مرة أخرى لاحقًا';
      case SignInAuthError.unknown:
        return 'حدث خطأ، حاول مرة أخرى';
    }
  }
}

Color getStatusBadgeColor(String status) {
  switch (status) {
    case "المعلقة":
      return ColorManager.lightGrayColor;
    case "المقبولة":
      return ColorManager.lightSecondary;
    case "الملغية":
      return ColorManager.lightPrimary;
    case "مكتملة":
      return ColorManager.lightGreenColor;
    default:
      return ColorManager.primary;
  }
}

Color getStatusTextColor(String status) {
  switch (status) {
    case "المعلقة":
      return ColorManager.darkGrayColor;
    case "المقبولة":
      return ColorManager.primary;
    case "الملغية":
      return ColorManager.error;
    case "مكتملة":
      return ColorManager.greenColor;
    default:
      return ColorManager.white;
  }
}