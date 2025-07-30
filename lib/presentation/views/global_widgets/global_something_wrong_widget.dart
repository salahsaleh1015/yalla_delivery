

import 'package:flutter/material.dart';

class GlobalSomethingWrongWidget extends StatelessWidget {
  const GlobalSomethingWrongWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "هناك خطأ ما حاول مره اخرى لاحقا",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}