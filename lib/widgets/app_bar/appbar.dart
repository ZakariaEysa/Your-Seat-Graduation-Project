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

      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style:theme.textTheme.labelLarge!.copyWith(fontSize:30),
      ),
      centerTitle: true,
      leading: actions != null ? actions![0] : null ,
    );
  }
}
