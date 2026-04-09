import 'package:delivery_app/core/services/firebase_services/firestore_feed_back_services.dart';

import '../../../domain/entities/feed_back_entity/feed_back_entity.dart';

abstract class FeedbackDataSource {
  Future<void> addFeedBack({required FeedBackEntity feedback});
}

class FeedBackDataSourceImpl implements FeedbackDataSource {
  FeedBackDataSourceImpl(this.feedBackServices);
  FireStoreFeedBackServices feedBackServices;

  @override
  Future<void> addFeedBack({required FeedBackEntity feedback}) async {
    await feedBackServices.addFeedbackToFireStore(feedbackEntity: feedback);
  }
}
