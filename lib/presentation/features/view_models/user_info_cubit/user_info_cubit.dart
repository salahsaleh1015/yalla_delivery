import 'package:delivery_app/presentation/features/models/user_model.dart';
import 'package:delivery_app/services/firebase_services/firestore_user_info_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitialState());

  final FirebaseUserServices _firebaseUserServices = FirebaseUserServices();

  Future<void> addUserToFirebaseStore({
    required UserModel userModel,
    required bool isSignUpFlow,
  }) async {
    emit(UserInfoAddLoadingState());

    try {
      final exists = await _firebaseUserServices
          .checkUserExistsByPhone(userModel.phoneNumber);

      if (isSignUpFlow && exists) {
        emit(UserInfoFoundedState());
        return;
      }
      if (!isSignUpFlow && !exists) {
        emit(UserInfoNotFoundedState());
        return;
      }

      // Only add user if it's sign up
      if (isSignUpFlow) {
        await _firebaseUserServices.addUserToFireStore(userModel);
      }
      emit(UserInfoAddedSuccessFulState());
    } catch (error) {
      emit(UserInfoErrorState(error: error.toString()));
    }

    // await  _firebaseUserServices.addUserToFireStore(userModel).then((value) {
    //   emit(UserInfoAddedSuccessFulState());
    // }).catchError((error) {
    //   emit(UserInfoErrorState(error: error.toString()));
    // });
  }
}
