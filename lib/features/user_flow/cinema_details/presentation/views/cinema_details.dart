import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/cinema_details/presentation/widgets/cinema_comments.dart';
import 'package:yourseatgraduationproject/features/user_flow/cinema_details/presentation/widgets/cinema_movies.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';

class CinemaDetails extends StatelessWidget {
  const CinemaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang=S.of(context);
    return ScaffoldF(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Stack(children: [
                Image.asset(
                  'assets/images/Rectangle 49 (3).png',
                  width: 430.w,
                  height: 241.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:  EdgeInsets.only(top:50.h),
                  child: IconButton(onPressed:(){
                    navigateTo(context: context, screen:const HomeLayout());
                  }, icon:const Icon(Icons.arrow_back,color: Colors.white,size:16,weight: 16,)),
                ),

                Positioned(
                  top: 200.h,
                  left: 10.w,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.all(8.sp),
                    color: const Color(0xFF37313B).withOpacity(.71),
                    width: 370.w,
                    height: 170.h,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.IMAX_Cinema,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 13.sp),
                          ),
                          Text(
                            lang.StatUpIsPlannedFor2025TypeOfTheaterKnownForItsLargeScreenSizeAndHighQualitySoundSystemItOffersAnImmersiveViewingExperienceForMoviesDocumentariesAndOtherContent
                          ,
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 11.sp,
                                color: const Color(0xFFD4D0D0)),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                               lang.review,
                                textAlign: TextAlign.start,
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 16.sp),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                'assets/images/cinemastar.png',
                                width: 13.w,
                                height: 12.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text('4.8 (1.222)',style:theme.textTheme.bodyMedium!.copyWith(fontSize:12.sp))
                            ],
                          ),
                          Image.asset('assets/images/cinemastars.png',
                              width: 200.w, height: 30.h)
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Text(
                 lang.movies,
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
                 lang.comments,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child:CinemaComments(
                    image: "assets/images/image (1).png",
                    title:lang.GreatSelectionOfMoviesHighlyRecommended,
                    titlename: "@Iva588"),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: CinemaComments(

                    image: "assets/images/image (4).png",
                    title:
                      lang.theLuxuriousSeatsAndImmersiveSoundSystemMakeForATrulyUnforgettable,
                    titlename: "@Rana158"),
              ),

              Padding(
                padding: EdgeInsets.all(10.0.sp),  child: CinemaComments(
                    image: "assets/images/image (1).png",
                    title:
                    lang.TheCinemasModernDesignAndAestheticallyPleasingDecorCreateAWelcomingAtmosphere
                      ,
                    titlename: "@Mahmoud"),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: TextFormFieldBuilder(
                      controller: TextEditingController(),
                      type: TextInputType.text,
                      width: 300.w,
                      height: 45.h,
                      color: const Color(0xFF110C3B),
                      obsecure: false,
                      label:lang.addComment,
                    ),
                  ),
                  Image.asset(
                    "assets/icons/Vector (4).png",
                    width: 25.w,
                    height: 25.h,
                  )
                ],
              )
            ])));
  }
}
