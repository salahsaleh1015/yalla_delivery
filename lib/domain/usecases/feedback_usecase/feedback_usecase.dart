


import 'package:dartz/dartz.dart';
import 'package:delivery_app/domain/entities/feed_back_entity/feed_back_entity.dart';
import 'package:delivery_app/domain/repos/feedback_repo/feedback_repo.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';

class AddFeedbackUseCase extends UseCase<void, FeedBackEntity> {
  FeedBackRepo feedBackRepos;
  AddFeedbackUseCase(this.feedBackRepos);

  @override
  Future<Either<Failure, void>> call(FeedBackEntity feedback) async {
    // check permission
    return await feedBackRepos.addFeedback(feedback: feedback);
  }
}