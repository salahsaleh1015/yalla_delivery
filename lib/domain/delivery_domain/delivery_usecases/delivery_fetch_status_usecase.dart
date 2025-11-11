


import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/core/usecase/usecase.dart';

import '../delivery_repos/delivery_info_repo.dart';

class DeliveryFetchStatusUseCase
    extends UseCase<String, String> {

  DeliveryInfoRepo deliveryInfoRepo;
  DeliveryFetchStatusUseCase(this.deliveryInfoRepo);

  @override
  Future<Either<Failure, String>> call({
    required String param,
  }) async {
    return await deliveryInfoRepo.getDeliveryStatus(
      deliveryMail: param,
    );
  }
}
