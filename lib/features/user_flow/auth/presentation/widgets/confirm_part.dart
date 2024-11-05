import 'package:flutter/material.dart';

import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';

class ConfirmPart extends StatelessWidget {


  String title;
  ConfirmPart({super.key, required this.title, required controllers});

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: Row(
          children: [
            TextFormFieldBuilder(
              type: TextInputType.number,
              width: 50,
              height: 71,
              color: Colors.white,

              label: title,
              textAlign: TextAlign.center,
              obsecure: false, controller:TextEditingController(),




            ),



          ],
        ));
  }
}