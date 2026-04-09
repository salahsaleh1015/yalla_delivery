import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/models/feedback_model.dart';
import '../../../domain/entities/feed_back_entity/feed_back_entity.dart';

class FireStoreFeedBackServices {
  final CollectionReference _feedBackCollectionRef =
      FirebaseFirestore.instance.collection("Recommendations");

  Future<void> addFeedbackToFireStore(
      {required FeedBackEntity feedbackEntity}) async {
    final docRef = _feedBackCollectionRef.doc();

    final model = FeedbackModel(
        id: docRef.id,
        details: feedbackEntity.feedbackDetails,
        title: feedbackEntity.feedbackTitle);

    await docRef.set(model.toJson());
  }
}
