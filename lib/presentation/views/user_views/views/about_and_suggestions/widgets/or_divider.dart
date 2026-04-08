import 'package:delivery_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(color: Colors.grey.shade200, thickness: 0.8)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: ColorManager.lightPrimary,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
            child: Divider(color: Colors.grey.shade200, thickness: 0.8)),
      ],
    );
  }
}