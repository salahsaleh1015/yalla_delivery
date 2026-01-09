






import 'package:dartz/dartz.dart';
import 'package:delivery_app/core/errors/failure.dart';
import 'package:delivery_app/domain/repos/delivery_management_repos/delivery_management_repos.dart';

import '../../../core/usecase/usecase.dart';
import '../../entities/delivery_management_entities/delivery_entity.dart';

class GetUnAvailableDeliveriesUseCase extends UseCase<List<DeliveryEntity>, String> {
  DeliveryManagementRepo deliveryManagementRepos;

  GetUnAvailableDeliveriesUseCase(this.deliveryManagementRepos);

  @override
  Future<Either<Failure, List<DeliveryEntity>>> call(String param) async {
    return await deliveryManagementRepos.getUnAvailableDeliveries(status: param);
  }
}