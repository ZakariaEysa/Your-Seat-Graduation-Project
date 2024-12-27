import 'package:flutter/material.dart';

class Left extends StatelessWidget {
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

 Left({super.key});

 @override
 Widget build(BuildContext context) {
  return Column(
   children: List.generate(lightSeats.length, (rowIndex) {
    // Looping through rows
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: List.generate(lightSeats[rowIndex].length, (colIndex) {
      String seat = lightSeats[rowIndex][colIndex];
      String seatImage = _getSeatImage(seat);

      return Padding(
       padding: const EdgeInsets.all(4.0),
       child: Image.asset(
        seatImage,
        width: 20,
        height: 20,
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
