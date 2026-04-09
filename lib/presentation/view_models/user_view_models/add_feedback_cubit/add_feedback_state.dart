

abstract class AddFeedbackStates {}

final class AddFeedbackInitialState extends AddFeedbackStates {}
final class AddFeedbackSuccessState extends AddFeedbackStates {}

final class AddFeedbackLoadingState extends AddFeedbackStates {}

final class AddFeedbackErrorState extends AddFeedbackStates {
  final String errorMsg;

  AddFeedbackErrorState({required this.errorMsg});
}