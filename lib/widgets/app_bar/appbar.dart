import 'package:flutter/material.dart';

class BuilderAppBar extends StatelessWidget {
  const BuilderAppBar({
    super.key,
    this.title = "",
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      backgroundColor: theme.primaryColor,
      title: Text(
        title,
        style: const TextStyle(fontSize:30),
      ),
      centerTitle: true,
    );
  }
}
