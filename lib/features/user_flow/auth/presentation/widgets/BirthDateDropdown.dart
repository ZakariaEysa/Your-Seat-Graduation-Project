import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthDateDropdown<T> extends StatelessWidget {
  final String hintText;
  final T? selectedValue;
  final List<T> itemsList;
  final ValueChanged<T?> onChanged;

  const BirthDateDropdown({
    required this.hintText,
    required this.selectedValue,
    required this.itemsList,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 120.w,
      height: 51.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF9C24D9), width: 2.w),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<T>(
        padding: const EdgeInsets.all(8),
        value: selectedValue,
        hint: Text(hintText, style: const TextStyle(color: Colors.white)),
        dropdownColor: Color( 0xFF2E1371),
        icon: Image.asset(
          'assets/images/arrow_down.png',
          width: 16.w,
          height: 16.h,
        ),
        items: itemsList.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString(), style: const TextStyle(color: Colors.white)),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true,
        underline: const SizedBox.shrink(),
      ),
    );
  }
}
