import 'package:flutter/material.dart';

class Left extends StatefulWidget {
  final Function(int) updateTotalPrice;
  final Function(int) updateSeatCategory;
  final List<String> reservedSeats; // ✅ المقاعد المحجوزة المتغيرة

  const Left({
    Key? key,
    required this.updateTotalPrice,
    required this.updateSeatCategory,
    required this.reservedSeats,
  }) : super(key: key);

  @override
  _LeftState createState() => _LeftState();
}

class _LeftState extends State<Left> {
  List<List<String>> leftSeats = [];

  @override
  void initState() {
    super.initState();
    _initializeSeats();
  }

  @override
  void didUpdateWidget(covariant Left oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.reservedSeats != oldWidget.reservedSeats) {
      _initializeSeats(); // ✅ تحديث المقاعد عند تغير `reservedSeats`
    }
  }

  void _initializeSeats() {
    leftSeats = List.generate(9, (_) => List.filled(6, 'a'));
    for (var seat in widget.reservedSeats) {
      int row = int.parse(seat) ~/ 6;
      int col = int.parse(seat) % 6;
      if (row < leftSeats.length && col < leftSeats[row].length) {
        leftSeats[row][col] = 'r';
      }
    }
    setState(() {});
  }

  void _selectSeat(int x, int y) {
    setState(() {
      if (leftSeats[x][y] == 'a') {
        widget.updateSeatCategory(x);
        widget.updateTotalPrice(_calculateSeatPrice(x));
        leftSeats[x][y] = 's';
      } else if (leftSeats[x][y] == 's') {
        widget.updateTotalPrice(-_calculateSeatPrice(x));
        leftSeats[x][y] = 'a';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(leftSeats.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(leftSeats[rowIndex].length, (colIndex) {
            String seat = leftSeats[rowIndex][colIndex];
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
