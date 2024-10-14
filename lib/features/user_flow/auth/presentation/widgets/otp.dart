import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/widgets/text_field/text_field/text_form_field_builder.dart';

class OTP extends StatelessWidget{
  String title;
   OTP({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: 52,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF8C34FC)),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 11, left: 20),
            child: Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 32),
            ),
          )
        ],
      ),
    );
  }}
