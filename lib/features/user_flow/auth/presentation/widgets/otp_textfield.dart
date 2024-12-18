import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final Function({required String value, required FocusNode focusNode}) nextField;

  const OtpFieldWidget({
    Key? key,
    required this.controller,
    required this.currentFocus,
    required this.nextFocus,
    required this.nextField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          nextField(value: value, focusNode: nextFocus ?? FocusNode());
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // قبول الأرقام فقط
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2E1371),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0x66000000), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
          counterText: "",
        ),
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
