


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../delivery_entities/delivery_account_entity.dart';
import '../../delivery_repos/delivery_account_repo.dart';

class DeliveryEditAccountDataUseCase
    extends UseCase<void, DeliveryAccountEntity> {

  DeliveryAccountRepo deliveryAccountRepos;
  DeliveryEditAccountDataUseCase(this.deliveryAccountRepos);

  @override
  Future<Either<Failure, void>> call({
    required DeliveryAccountEntity param,
  }) async {
    return await deliveryAccountRepos.editDeliveryAccountData(
      deliveryAccountEntity: param,

    );
  }
}


// class EditDeliveryParams {
//   final String deliveryMail;
//   final DeliveryAccountEntity deliveryAccountEntity;
//
//   EditDeliveryParams({
//     required this.deliveryMail,
//     required this.deliveryAccountEntity,
//   });
// }
