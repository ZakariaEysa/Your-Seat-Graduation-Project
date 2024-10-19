import 'package:flutter/material.dart';

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
    return Container(
      width: 120,
      height: 51,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF9C24D9), width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<T>(
        padding: const EdgeInsets.all(8),
        value: selectedValue,
        hint: Text(hintText, style: const TextStyle(color: Colors.white)),
        dropdownColor: const Color( 0xFF2E1371),
        icon: Image.asset(
          'assets/images/arrow_down.png',
          width: 16,
          height: 16,
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
