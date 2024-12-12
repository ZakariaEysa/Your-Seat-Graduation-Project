import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/now_playing/presentation/widgets/playing_movies.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/app.dart';

class NowPLaying extends StatelessWidget{
  const NowPLaying({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
   return ScaffoldF(
       body:SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 9.h,),
             Row(
               children: [
                 Padding(
                   padding: EdgeInsets.only(bottom:10.h),
                   child: const PlayingMovies(image:"assets/images/film88.png", title:"Avengers: Infinity\nWar"),
                 ),

                   const PlayingMovies(image: "assets/images/film2.png", title: "Shang chi: Legend of\nthe Ten Rings"),],
             ),
             SizedBox(height:20.h,),
              Row(
               children: [
                 Padding(
                   padding: EdgeInsets.only(bottom:.20.h,),
                   child: const PlayingMovies(image:"assets/images/film3.png", title:"Guardians Of The\nGalaxy"),
                 ),
                 const PlayingMovies(image: "assets/images/film14.png", title: "Batman v Superman\nDawn of Justice"),],
             ),
             SizedBox(height: 40.h,)
         
         
           ],
         ),
       )
   );
  }

}