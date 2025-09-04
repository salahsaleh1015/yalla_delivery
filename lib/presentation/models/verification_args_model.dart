





import 'package:delivery_app/presentation/models/user_model.dart';

class VerificationArgs {
  //final String phoneNumber;
  final bool isSignUpFlow;
  final UserModel userModel;

  VerificationArgs({required this.isSignUpFlow,
    //required this.phoneNumber,
    required this.userModel});
}
