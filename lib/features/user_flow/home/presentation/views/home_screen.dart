import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/head_widget.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/text.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../Widget/chatbot.dart';
import '../Widget/cinema_item.dart';
import '../Widget/coming_soon.dart';
import '../Widget/movie_carousel_widget.dart';
import '../Widget/search.dart';
import '../Widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Stack(
      children: [
        ScaffoldF(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                   HeadWidget(),

                    Search(),
                SizedBox(height: 20.h),
                TextWidget(text: "lang.Nowplaying"),
                SizedBox(height: 20.h),
                Container(
                  height: 500.sp,
                  child:
                  MovieCarouselWidget(),
                ),
                //  SizedBox(height: 15.h,),
                TextWidget(text:"lang.Comingsoon" ),
                SizedBox(height: 10.h),
                Container(
                  height: 400.h,
                  child:
                  ComingSoon(), // Horizontal list of coming soon movies
                ),
                TextS(
                 text:" lang.PromoDiscount,"
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/images/discount.png"),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 10),
                    child: TextS(text: "lang.cinema",

                    ),
                  ),
                ),





    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CinemaItem(),
                ),
              ],
            ),
          ),
        ),
        // Use the DraggableFloatingButton here
        const DraggableFloatingButton(),
      ],
    );
  }
}
