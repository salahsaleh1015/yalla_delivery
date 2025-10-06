import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delivery_authentication_state.dart';

class DeliveryAuthenticationCubit extends Cubit<DeliveryAuthenticationStates> {
  DeliveryAuthenticationCubit() : super(DeliveryAuthenticationInitialState());

  static DeliveryAuthenticationCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void deliverySignInWithEmailAndPassword(
      {required String email, required String password}) async{
    emit(DeliveryAuthenticationLoadingState());
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((val) {
        emit(DeliveryAuthenticationSuccessState());
      });
    } catch (error) {
      emit(DeliveryAuthenticationErrorState(errorMessage: error.toString()));
    }
  }



}
