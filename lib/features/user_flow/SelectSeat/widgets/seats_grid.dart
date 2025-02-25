import 'package:flutter/material.dart';

class SeatsGrid extends StatefulWidget {
  final Function(int) updateTotalPrice;
  final Function(int) updateSeatCategory;
  final List<String> reservedSeats;

  const SeatsGrid({
    super.key,
    required this.updateTotalPrice,
    required this.updateSeatCategory,
    required this.reservedSeats,
  });

  @override
  _SeatsGridState createState() => _SeatsGridState();
}

class _SeatsGridState extends State<SeatsGrid> {
  List<List<String>> seats = [];

  @override
  void initState() {
    super.initState();
    _initializeSeats();
  }

  @override
  void didUpdateWidget(covariant SeatsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.reservedSeats != oldWidget.reservedSeats) {
      _initializeSeats(); // ✅ تحديث المقاعد عند تغير `reservedSeats`
    }
  }

  void _initializeSeats() {
    int totalColumns = 13; // ✅ عدد الأعمدة مع إضافة الممر في المنتصف
    seats = List.generate(9, (_) => List.filled(totalColumns, 'a'));

    for (var seat in widget.reservedSeats) {
      int seatNumber = int.parse(seat);
      int row = seatNumber ~/ 12;
      int col = seatNumber % 12;
      if (col >= 6) col++; // ✅ تعويض الممر في الحسابات
      if (row < seats.length && col < seats[row].length) {
        seats[row][col] = 'r'; // ✅ تحديث حالة المقعد كمحجوز
      }
    }
    setState(() {});
  }

  void _selectSeat(int x, int y) {
    if (seats[x][y] == 'r') return; // ❌ لا يمكن تحديد المقعد المحجوز

    setState(() {
      if (seats[x][y] == 'a') {
        widget.updateSeatCategory(x);
        widget.updateTotalPrice(_calculateSeatPrice(x));
        seats[x][y] = 's';
      } else if (seats[x][y] == 's') {
        widget.updateTotalPrice(-_calculateSeatPrice(x));
        seats[x][y] = 'a';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(seats.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(seats[rowIndex].length, (colIndex) {
            if (colIndex == 6) {
              return const SizedBox(width: 30); // ✅ الممر بين الجانبين
            }
            String seat = seats[rowIndex][colIndex];
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
    if (row < 2) return 150;
    if (row < 4) return 120;
    return 100;
  }
}
