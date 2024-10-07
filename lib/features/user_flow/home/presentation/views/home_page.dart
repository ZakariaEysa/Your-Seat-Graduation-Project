import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(lang.signin),
    );
  }
}
