import 'package:flutter/material.dart';

class BuilderAppBar extends StatelessWidget {
  const BuilderAppBar({
    super.key,
    this.title = "",
    this.actions

  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      actions: actions,
      title: Text(
        title,
        style: const TextStyle(fontSize:30),
      ),
      centerTitle: true,
    );
  }
}
