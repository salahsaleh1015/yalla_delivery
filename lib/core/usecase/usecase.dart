
import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';

abstract class UseCase <T , Param>{
  Future<Either<Failure , T>> call({ required Param param});
}
class NoParam{}