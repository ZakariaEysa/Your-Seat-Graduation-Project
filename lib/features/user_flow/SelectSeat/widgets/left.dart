import 'package:flutter/material.dart';

class Left extends StatefulWidget {
 final Function(int) updateTotalPrice;

 final Function(int) updateSeatCategory; // إضافة الدالة الجديدة

 const Left({super.key, required this.updateTotalPrice, required this.updateSeatCategory});


 @override
 _LeftState createState() => _LeftState();
}

class _LeftState extends State<Left> {
 List<List<String>> lightSeats = [
  ['a', 'a', 'a', 'a', 'a', 'a'],
  ['a', 'a', 'r', 'r', 'r', 'r'],
  ['r', 'r', 'r', 'r', 'r', 'r'],
  ['a', 'a', 'a', 'a', 'a', 'a'],
  ['a', 'a', 'a', 'a', 'a', 'a'],
  ['a', 'a', 'a', 'a', 'a', 'a'],
  ['a', 'a', 'a', 'a', 'a', 'a'],
  ['a', 'a', 'a', 'a', 'a', 'a'],
  ['a', 'a', 'a', 'a', 'a', 'a'],
 ];

 void _selectSeat(int x, int y) {
  setState(() {
   if (lightSeats[x][y] == 'a') {
    widget.updateSeatCategory(x);
    widget.updateTotalPrice(_calculateSeatPrice(x));
    lightSeats[x][y] = 's';
   } else if (lightSeats[x][y] == 's') {
    widget.updateTotalPrice(-_calculateSeatPrice(x));
    lightSeats[x][y] = 'a';
   }
  });
 }

 @override
 Widget build(BuildContext context) {
  return Column(
   children: List.generate(lightSeats.length, (rowIndex) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: List.generate(lightSeats[rowIndex].length, (colIndex) {
      String seat = lightSeats[rowIndex][colIndex];
      String seatImage = _getSeatImage(seat);

      return GestureDetector(
       onTap: () => _selectSeat(rowIndex, colIndex),
       child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
         seatImage,
         width: 20,
         height: 20,
        ),
       ),
      );
     }),
    );
   }),
  );
 }

 String _getSeatImage(String seat) {
  switch (seat) {
   case 'a':
    return 'assets/images/avaliableSeat.png';
   case 'r':
    return 'assets/images/reversedSeat.png';
   case 's':
    return 'assets/images/selectSeat.png';
   default:
    return 'assets/images/default.png';
  }
 }

 int _calculateSeatPrice(int row) {
  if (row < 2) {
   return 150;
  } else if (row < 4) {
   return 120;
  } else {
   return 100;
  }
 }
}
