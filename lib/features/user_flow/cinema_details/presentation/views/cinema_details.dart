import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/cinema_details/presentation/widgets/cinema_comments.dart';
import 'package:yourseatgraduationproject/features/user_flow/cinema_details/presentation/widgets/cinema_movies.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_screen.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';

class CinemaDetails extends StatelessWidget {
  const CinemaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
          Stack(children: [
            Image.asset(
              'assets/images/image 12.png',
              width: 400.w,
              height: 360.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              left:0,
              right:370,
              bottom: 240,
              child:IconButton(onPressed: (){
                navigateTo(context: context, screen:HomeLayout());
              }, icon:Icon(Icons.arrow_back),color: Colors.white,)
            ),
            Positioned(
              top: 200,
              left:10,
              right:10,
              bottom:0,
              child: Container(
                padding: EdgeInsets.all(8.sp),
                color: const Color(0xCB786E7C),
                width: 360.w,
                height: 150.h,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IMAX Cinema',
                        style:
                            theme.textTheme.bodyMedium!.copyWith(fontSize:14.sp),
                      ),
                      Text(
                        'StatUp is planned for 2025, type of theater known for'
                        ' its large screen size and high-quality sound system.'
                        ' It offers an immersive viewing experience for movies,'
                        ' documentaries, and other content',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize:13.sp, color: const Color(0xFFD4D0D0)),
                      ),
                      SizedBox(height:5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Review',
                            textAlign: TextAlign.start,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontSize:16.sp),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Image.asset(
                            'assets/images/cinemastar.png',
                            width: 14.w,
                            height:12.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('4.8 (1.222)')
                        ],
                      ),
                      Image.asset('assets/images/cinemastars.png',
                          width:100.w, height:15.h)
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Text(
              'Movies',
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
            ),
          ),
          Row(
            children: [
              const CinemaMovies(
                  image: "assets/images/movie1.png",
                  title: "Shazam: Fury of the Gods"),
              SizedBox(width: 10.w),
              const CinemaMovies(
                  image: "assets/images/movies2.png",
                  title: "Avengers: Infinity War")
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Text(
              'Comments',
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
            ),
          ),
           Padding(
            padding: EdgeInsets.all(8.sp),
            child: const CinemaComments(
                image: "assets/images/image (1).png",
                title: "Great selection of movies . Highly recommended!",
                titlename: "@Iva588"),
          ),
           Padding(
            padding: EdgeInsets.all(8.sp),
            child: const CinemaComments(
                image: "assets/images/image (4).png",
                title:
                    "The luxurious seats and immersive sound system\nmake for a truly unforgettable",
                titlename: "@Rana158"),
          ),
           Padding(
            padding: EdgeInsets.all(8.sp),
            child: const CinemaComments(
                image: "assets/images/image (1).png",
                title:
                    "The cinema's modern design and aesthetically\npleasing decor create a welcoming atmosphere",
                titlename: "@Mahmoud"),
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.all(16.sp),
                child: TextFormFieldBuilder(
                  controller: TextEditingController(),
                  type: TextInputType.text,
                  width: 300.w,
                  height: 45.h,
                  color: const Color(0xFF110C3B),
                  obsecure: false,
                  label: 'Add Comment',
                ),
              ),
              Image.asset(
                "assets/icons/Vector (4).png",
                width:25.w,
                height:25.h,
              )
            ],
          )
        ])));
  }
}
