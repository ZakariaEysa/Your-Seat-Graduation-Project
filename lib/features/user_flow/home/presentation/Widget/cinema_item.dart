import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../cinema_details/presentation/views/cinema_details.dart';


class CinemaItem extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'Retal',
      'image': 'assets/images/Retal.png',
    },
    {
      'title': 'Imax',
      'image': 'assets/images/IMAX.png',
    },
    {
      'title': '4DX',
      'image': 'assets/images/4DX.png',
    },
    {
      'title': 'Sweetbox',
      'image': 'assets/images/Sweetbox.png',
    },
  ];

   CinemaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
onTap: (){

  navigateTo(context: context, screen: const CinemaDetails());
},
                  child: ClipOval(
                    child: Image.asset(
                      movie['image']!,
                      height: 120.h,
                      width: 120.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  movie['title']!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Color(0xFFFFFFFF)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
