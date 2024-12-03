import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int startSeconds;
  final VoidCallback onResend;

  const CountdownTimer({
    super.key,
    this.startSeconds = 59,
    required this.onResend,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int remainingSeconds;
  Timer? timer;

  bool showResend = false;

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          showResend = true;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      remainingSeconds = widget.startSeconds;
      showResend = false;
    });
    timer?.cancel();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return showResend
        ? TextButton(
      onPressed: () {
        widget.onResend();
        resetTimer();
      },
      child: const Text(
        "Resend !",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,

        ),
      ),
    )
        : Text(
      _formatTime(remainingSeconds),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
}

    String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
}
