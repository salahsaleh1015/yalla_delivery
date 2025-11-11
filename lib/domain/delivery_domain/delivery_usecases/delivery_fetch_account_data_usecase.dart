import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/core/usecase/usecase.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_repos/delivery_info_repo.dart';

class DeliveryFetchInfoDataUseCase
    extends UseCase<DeliveryInfoEntity, String> {
  DeliveryInfoRepo deliveryAccountRepos;
  DeliveryFetchInfoDataUseCase(this.deliveryAccountRepos);

  @override
  Future<Either<Failure, DeliveryInfoEntity>> call({
    required String param,
  }) async {
    return await deliveryAccountRepos.fetchDeliveryAccountData(
      deliveryMail: param,
    );
  }
}
