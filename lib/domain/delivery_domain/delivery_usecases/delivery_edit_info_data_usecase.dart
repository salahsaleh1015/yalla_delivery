


import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../delivery_entities/delivery_account_entity.dart';
import '../delivery_repos/delivery_info_repo.dart';

class DeliveryEditInfoDataUseCase
    extends UseCase<void, DeliveryInfoEntity> {

  DeliveryInfoRepo deliveryAccountRepos;
  DeliveryEditInfoDataUseCase(this.deliveryAccountRepos);

  @override
  Future<Either<Failure, void>> call({
    required DeliveryInfoEntity param,
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
