
import 'package:delivery_app/core/resources/constants_manager.dart';

import 'package:delivery_app/presentation/views/global_widgets/global_decorated_container.dart';
import 'package:flutter/material.dart';

class GlobalOrderDetailsWidget extends StatelessWidget {
  const GlobalOrderDetailsWidget({super.key, required this.orderDetails,});
  final String orderDetails;

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      child: Text(
        orderDetails,
        maxLines: AppConstant.maxLinesOfOrderDetails,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
