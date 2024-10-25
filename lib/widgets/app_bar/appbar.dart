import 'package:flutter/material.dart';

class BuilderAppBar extends StatelessWidget {
  const BuilderAppBar({
    this.leading,
    super.key,
    this.title = "",
    this.actions

  });

  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style:theme.textTheme.labelLarge!.copyWith(fontSize:30),
      ),
      centerTitle: true,
      leading: leading ,
      actions: actions,
    );
  }
}
