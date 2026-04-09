


import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';

import '../../entities/feed_back_entity/feed_back_entity.dart';

abstract class FeedBackRepo{
  Future<Either<Failure,void>> addFeedback({required FeedBackEntity feedback});
}