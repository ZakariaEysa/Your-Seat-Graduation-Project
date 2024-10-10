import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/resources/color_manager.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../resources/app_styles_manager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return ScaffoldF(
      body: Container(
        //! example of how to use ScaffoldF and access ColorManagerClass and AppStylesManager class
        color: ColorManager.primaryW,
        alignment: Alignment.center,
        child: Text(lang.signin, style: AppStylesManager.customTextStyleBl),
      ),
    );
  }
}
