enum SignUpAuthError {
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  operationNotAllowed,
  networkError,
  tooManyRequests,
  unknown,
}


enum SignInAuthError {
  userNotFound,
  wrongPassword,
  invalidEmail,
  userDisabled,
  invalidCredential,
  networkError,
  tooManyRequests,
  unknown,
}