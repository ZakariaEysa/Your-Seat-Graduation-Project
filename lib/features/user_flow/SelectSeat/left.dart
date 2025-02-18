import 'package:flutter/material.dart';

class Left extends StatefulWidget {
 Left({super.key});

 @override
 _LeftState createState() => _LeftState();
}

class _LeftState extends State<Left> {
 List<List<String>> lightSeats = [
  ['a', 'a', 'a', 'a', 'a', 'a'],
  ['r', 'r', 'r', 'r', 'r', 'r'],
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
    lightSeats[x][y] = 's';
   } else if (lightSeats[x][y] == 's') {
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
  if (seat == 'a') {
   return 'assets/images/avaliableSeat.png'; // Available seat image
  } else if (seat == 'r') {
   return 'assets/images/reversedSeat.png'; // Reserved seat image
  } else if (seat == 's') {
   return 'assets/images/selectSeat.png'; // Selected seat image
  } else {
   return 'assets/images/default.png'; // Default image if no match
  }
 }
}
