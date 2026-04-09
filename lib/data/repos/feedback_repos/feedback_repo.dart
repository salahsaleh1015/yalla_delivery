import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/data/data_sources/feedback_data_source/feedback_data_source.dart';

import 'package:delivery_app/domain/entities/feed_back_entity/feed_back_entity.dart';

import '../../../domain/repos/feedback_repo/feedback_repo.dart';

class FeedBackRepoImpl implements FeedBackRepo {
  FeedbackDataSource feedbackDataSource;

  FeedBackRepoImpl(this.feedbackDataSource);

  @override
  Future<Either<Failure, void>> addFeedback(
      {required FeedBackEntity feedback}) async {
    try {
      await feedbackDataSource.addFeedBack(
        feedback: feedback,
      );
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
