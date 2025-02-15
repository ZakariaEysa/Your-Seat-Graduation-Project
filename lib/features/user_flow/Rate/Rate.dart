import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../utils/navigation.dart';
import '../Notifaction/views/Notifaction.dart';
import '../home/presentation/Widget/search.dart';
import '../home/presentation/views/home_layout.dart';
import 'Rating.dart';

class Rate extends StatelessWidget {
  const Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      body: Column(
        children: [
          SizedBox(
           // height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/yourseat.png",
                  width: 190.w,
                //  height: 120.h,
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(context: context, screen: Notifications());
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(10.sp),
                    child: Image.asset(
                      "assets/icons/notification_icon.png",
                      width: 36.w,
                   //   height: 115.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        //  SizedBox(height: 5.h),
          const Search(),
          //SizedBox(height: 5.h),
          const Rating(),
        //  SizedBox(height: 5.h,),
        ],
      ),
    );
  }
}
