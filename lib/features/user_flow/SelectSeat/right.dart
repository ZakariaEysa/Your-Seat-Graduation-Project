import 'package:flutter/material.dart';

class Right extends StatelessWidget {
  List<List<String>> rightSeats = [
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 's', 's', 'a'],
    ['r', 'r', 'a', 'a', 'a', 'r'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['r', 'r', 'r', 'r', 'r', 'r'],
  ];

  Right({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rightSeats.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((seat) {
            String seatImage = _getSeatImage(seat);
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                seatImage,
                width: 20,
                height: 20,
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  String _getSeatImage(String seat) {
    if (seat == 'a') {
      return 'assets/images/avaliableSeat.png';
    } else if (seat == 'r') {
      return 'assets/images/reversedSeat.png';
    } else {
      return 'assets/images/selectSeat.png';
    }
  }
}
