import 'package:delivery_app/presentation/global_widgets/global_decorated_container.dart';
import 'package:delivery_app/resources/constants_manager.dart';
import 'package:flutter/material.dart';

class GlobalOrderDetailsWidget extends StatelessWidget {
  const GlobalOrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalDecoratedContainer(
      child: Text(
        "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
        maxLines: AppConstant.maxLinesOfOrderDetails,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
