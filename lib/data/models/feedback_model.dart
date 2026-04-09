import 'package:delivery_app/domain/entities/feed_back_entity/feed_back_entity.dart';

class FeedbackModel extends FeedBackEntity {
  String? title, id, details;

  FeedbackModel({
    String? id,
    String? title,
    String? details,
  }) : super(
            feedbackDetails: details ?? '',
            feedbackId: id ?? '',
            feedbackTitle: title ?? '');



  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'recommendationId': feedbackId,
      'recommendationTitle': feedbackTitle,
      'recommendationDetails': feedbackDetails,
    };
  }
}
