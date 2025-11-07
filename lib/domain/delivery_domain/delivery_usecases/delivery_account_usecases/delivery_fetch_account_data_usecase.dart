import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/core/usecase/usecase.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_entities/delivery_account_entity.dart';
import 'package:delivery_app/domain/delivery_domain/delivery_repos/delivery_account_repo.dart';

class DeliveryFetchAccountDataUseCase
    extends UseCase<DeliveryAccountEntity, String> {
  DeliveryAccountRepo deliveryAccountRepos;
  DeliveryFetchAccountDataUseCase(this.deliveryAccountRepos);

  @override
  Future<Either<Failure, DeliveryAccountEntity>> call({
    required String param,
  }) async {
    return await deliveryAccountRepos.fetchDeliveryAccountData(
      deliveryMail: param,
    );
  }
}
