import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CinemaComments extends StatefulWidget {


  final String title;
  final String name;
  final String image;
  const CinemaComments({
    Key? key,
    required this.name,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  State<CinemaComments> createState() => _CinemaCommentsState();
}

class _CinemaCommentsState extends State<CinemaComments> {
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Container(
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF150B34),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage:
              widget.image.isNotEmpty
                  ? MemoryImage(base64Decode(widget.image))
                  : const AssetImage("assets/images/account.png")
              as ImageProvider,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "@${widget.name}",
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Text(
                    widget.title,
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}