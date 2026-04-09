

import 'package:delivery_app/domain/entities/feed_back_entity/feed_back_entity.dart';
import 'package:delivery_app/domain/usecases/feedback_usecase/feedback_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/add_feedback_cubit/add_feedback_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AddFeedbackCubit extends Cubit<AddFeedbackStates> {
  AddFeedbackCubit(this.addFeedbackUseCase) : super(AddFeedbackInitialState());
  AddFeedbackUseCase addFeedbackUseCase;
 static AddFeedbackCubit get(context)=>BlocProvider.of(context);

  Future<void> addFeedBack({
    required FeedBackEntity feedback,
  }) async {
    emit(AddFeedbackLoadingState());

    var result = await addFeedbackUseCase.call(feedback);

    result.fold(
          (failure) {
        emit(AddFeedbackErrorState(errorMsg: failure.message));
      },
          (deliveries) {
        emit(AddFeedbackSuccessState());
      },
    );
  }

}
