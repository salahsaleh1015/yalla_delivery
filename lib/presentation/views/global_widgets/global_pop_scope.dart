import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalPopScope extends StatelessWidget {
  const GlobalPopScope({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PopScope(
        // canPop: false prevents the default back navigation behavior
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? results) {
          if (didPop) return;
          // Logic to exit the app
          SystemNavigator.pop();
        },
        child: child);
  }
}
