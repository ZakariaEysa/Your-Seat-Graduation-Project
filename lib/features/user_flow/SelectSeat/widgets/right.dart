import 'package:flutter/material.dart';

class Right extends StatefulWidget {
  final Function(int) updateTotalPrice;
  final Function(int) updateSeatCategory;
  final List<String> reservedSeats; // ✅ المقاعد المحجوزة المتغيرة

  const Right({
    Key? key,
    required this.updateTotalPrice,
    required this.updateSeatCategory,
    required this.reservedSeats,
  }) : super(key: key);

  @override
  _RightState createState() => _RightState();
}

class _RightState extends State<Right> {
  List<List<String>> rightSeats = [];

  @override
  void initState() {
    super.initState();
    _initializeSeats();
  }

  @override
  void didUpdateWidget(covariant Right oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.reservedSeats != oldWidget.reservedSeats) {
      _initializeSeats(); // ✅ تحديث المقاعد عند تغير `reservedSeats`
    }
  }

  void _initializeSeats() {
    rightSeats = List.generate(9, (_) => List.filled(6, 'a'));
    for (var seat in widget.reservedSeats) {
      int row = int.parse(seat) ~/ 6;
      int col = int.parse(seat) % 6;
      if (row < rightSeats.length && col < rightSeats[row].length) {
        rightSeats[row][col] = 'r';
      }
    }
    setState(() {});
  }

  void _selectSeat(int x, int y) {
    setState(() {
      if (rightSeats[x][y] == 'a') {
        widget.updateSeatCategory(x);
        widget.updateTotalPrice(_calculateSeatPrice(x));
        rightSeats[x][y] = 's';
      } else if (rightSeats[x][y] == 's') {
        widget.updateTotalPrice(-_calculateSeatPrice(x));
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
              onTap: seat == 'r' ? null : () => _selectSeat(rowIndex, colIndex),
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
    if (row < 2) return 150;
    if (row < 4) return 120;
    return 100;
  }
}
