import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset("assets/images/loading1.gif"));
  }
}
