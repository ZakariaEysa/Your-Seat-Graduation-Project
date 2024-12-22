import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class PlayingMovies extends StatefulWidget {
  final String image;
  final String title;
  final String category;
  final String duration;
  final String rate;

  const PlayingMovies({
    super.key,
    required this.image,
    required this.title,
    required this.category, required this.duration, required this.rate,
  });

  @override
  State<PlayingMovies> createState() => _PlayingMoviesState();
}

class _PlayingMoviesState extends State<PlayingMovies> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(right: 8.w, left: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Prevent unnecessary stretching
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.image,
              width: 200.w,
              height: 250.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.title,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/cinemastar.png",
                width: 17.w,
                height: 18.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.rate,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isBookmarked = !_isBookmarked;
                  });
                },
                child: Icon(
                  Icons.bookmark,
                  color: _isBookmarked
                      ? Colors.purple
                      : Colors.grey.withOpacity(0.15),
                  size: 30.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/clock.png",
                width: 18.w,
                height: 18.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.duration,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/video.png",
                width: 18.w,
                height: 18.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.category,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
