import 'package:delivery_app/core/services/firebase_services/firestore_user_info_services.dart';
import 'package:delivery_app/data/models/user_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoStates> {
  UserInfoCubit() : super(UserInfoInitialState());

  static UserInfoCubit get(context) => BlocProvider.of(context);

  final FirebaseUserServices _firebaseUserServices = FirebaseUserServices();

  late UserModel user;
  late String userLocation;

  Future<void> addUserToFirebaseStore({
    required UserModel userModel,
    required bool isSignUpFlow,
  }) async {
    emit(UserInfoLoadingState());

    try {
      final exists = await _firebaseUserServices
          .checkUserExistsGMail(userModel.userMail);
      print(userModel.userMail);

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
  }

  Future<void> getUserByPhoneNumber(String phoneNumber) async {
    emit(UserInfoLoadingState());
    try {
      user = await _firebaseUserServices.getUserByPhoneNumber(phoneNumber);
      emit(UserInfoLoadedState(userModel: user));
    } catch (e) {
      emit(UserInfoErrorState(error: e.toString()));
    }
  }

  Future<void> updateUserByPhoneNumber({required UserModel updatedUser}) async {
    emit(UserInfoLoadingState());
    try {
      await _firebaseUserServices.updateUserInfo(updatedUser);

      user = updatedUser; // Update local user state
      emit(UserInfoUpdatedState(
        userModel: user,
      ));
    } catch (e) {
      emit(UserInfoErrorState(error: e.toString()));
    }
  }

  Future<void> getUserLocationByPhoneNumber({required String phoneNumber}) async {
    emit(UserLocationLoadingState());
    try {
      userLocation = await _firebaseUserServices.getUserLocationByPhoneNumber(
          phoneNumber: phoneNumber);
      emit(UserLocationLoadedSuccessfullyState());
    } catch (e) {
      emit(UserLocationErrorState(error: e.toString()));
    }
  }
}
