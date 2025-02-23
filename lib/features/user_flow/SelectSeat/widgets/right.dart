import 'package:flutter/material.dart';

class Right extends StatefulWidget {
  final Function(int) updateTotalPrice;
  final Function(int) updateSeatCategory; // إضافة الدالة الجديدة

  const Right({super.key, required this.updateTotalPrice, required this.updateSeatCategory});


  @override
  State<Right> createState() => _RightState();
}

class _RightState extends State<Right> {
  List<List<String>> rightSeats = [
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['r', 'r', 'a', 'a', 'a', 'r'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['a', 'a', 'a', 'a', 'a', 'a'],
    ['r', 'r', 'r', 'r', 'r', 'r'],
  ];

  void _selectSeat(int x, int y) {
    setState(() {
      if (rightSeats[x][y] == 'a') {
        widget.updateTotalPrice(_calculateSeatPrice(x));
        widget.updateSeatCategory(x);
        rightSeats[x][y] = 's';
      } else if (rightSeats[x][y] == 's') {
        widget.updateTotalPrice(- _calculateSeatPrice(x));
        rightSeats[x][y] = 'a';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(rightSeats.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(rightSeats[rowIndex].length, (colIndex) {
            String seat = rightSeats[rowIndex][colIndex];
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
      return 'assets/images/avaliableSeat.png';
    } else if (seat == 'r') {
      return 'assets/images/reversedSeat.png';
    } else {
      return 'assets/images/selectSeat.png';
    }
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
