import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchListPart extends StatelessWidget {
  final String smallimage;
  final String time;
  final String title;
  final String smalltitle;
  final String image;

  const WatchListPart({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.smallimage,
    required this.smalltitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 500.w, // Use screen width
        height: 150.h,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 100.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height:8),
                  Row(
                    children: [
                      Image.asset(smallimage, width:70, height:30),
                      const SizedBox(width: 10),
                      Text(
                        smalltitle,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: const Color(0XFFD9D9D9),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 100, right: 5),
              child: Image.asset(
                'assets/icons/close.png',
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
