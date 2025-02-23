// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourseatgraduationproject/features/user_flow/SelectSeat/view/SelectSeat.dart';

import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/cubit/movie_details_cubit.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/app_logs.dart';
import '../../../../../utils/dialog_utilits.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/network_image/image_replacer.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../auth/presentation/views/sign_in.dart';
import '../../data/model/movies_details_model/movies_details_model.dart';
import '../widgets/cinema_card.dart';
import '../widgets/director_actor_card.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.model,
    this.cinema = "",
  });

  final MoviesDetailsModel model;
  final String cinema;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  String selectedCinema = "";
  @override
  void initState() {
    AppLogs.scussessLog(widget.model.toString());

    AppLogs.scussessLog(widget.model.posterImage.toString());
    AppLogs.scussessLog(widget.model.toString());

    super.initState();

    BlocProvider.of<MovieDetailsCubit>(context)
      ..getRate(widget.model.name.toString())
      ..getCinemas(widget.model.name.toString());

    if (widget.cinema != "") {
      cinemas.add(widget.cinema);
    }
  }

  num rate = 0;
  List cinemas = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);

    return ScaffoldF(
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
          Stack(children: [
            ImageReplacer(
              imageUrl: widget.model.posterImage ?? "",
              width: 500.w,
              height: 390.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 50.h),
              child: IconButton(
                  onPressed: () {
                    navigatePop(context: context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            Positioned(
              top: 220.h,
              left: 10.w,
              right: 10.w,
              child: Container(
                padding: EdgeInsets.all(8.sp),
                color: const Color(0xFF2C113D).withOpacity(.81),
                width: 370.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.name ?? "",
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      widget.model.releaseDate ?? "",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 13.sp, color: const Color(0xFFD4D0D0)),
                    ),
                    SizedBox(height: 15.h),
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
                          width: 25.w,
                        ),
                        Image.asset(
                          'assets/images/cinemastar.png',
                          width: 15.w,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                          builder: (context, state) {
                            return Text(rate.toString(),
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 12.sp));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
                      listener: (context, state) {
                        AppLogs.debugLog(state.toString());
                        if (state is GetRateError) {
                          rate = 4;
                        }
                        if (state is GetRateSuccess) {
                          rate = double.parse(state.rate.split('/')[0]);
                          rate =
                              rate >= 6 ? rate.toDouble() / 2 : rate.toDouble();
                          if (rate == 0) {
                            rate = 4.1;
                          }
                        }
                      },
                      builder: (context, state) {
                        return Row(
                          children: [
                            RatingBar.builder(
                              initialRating: rate.toDouble(),
                              minRating: 1,
                              unratedColor: Color(0xFF575757),
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              itemSize: 29,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                size: 1,
                                color: Color(0xFFCCC919),
                              ),
                              onRatingUpdate: (rating) {
                                // print(rating);
                              },
                            ),
                            Spacer(),
                            TextButton.icon(
                                onPressed: () {
                                  VideoLauncher.launchYouTubeVideo(
                                      widget.model.trailer ?? "");
                                },
                                icon: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  lang.watchTrailer,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 12.sp, color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        const Color(0xFF2C113D)
                                            .withOpacity(.91)),
                                    shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: const BorderSide(
                                            color: Colors.white),
                                        // ... button styles
                                      ),
                                    )))
                          ],
                        );


                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, top: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      lang.movieGenre,
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 34.w,
                    ),
                    Text(
                      widget.model.category ?? "",
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      lang.censorship,
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 42.w,
                    ),
                    Text(
                      widget.model.ageRating ?? "",
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      lang.language,
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 57.w,
                    ),
                    Text(
                      widget.model.language ?? "",
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  lang.storyLine,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ReadMoreText(
                  widget.model.description ?? "",
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                  trimLines: 4,
                  textAlign: TextAlign.start,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: lang.seeMore,
                  trimExpandedText: lang.seeLess,
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  lang.director,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Director(
                          name: widget.model.crew?.director ?? "",
                          imagePath: "https://picsum.photos/150/150"),
                      Director(
                          name: widget.model.crew?.producer ?? "",
                          imagePath: "https://picsum.photos/150/130"),
                      Director(
                          name: widget.model.crew?.writer ?? "",
                          imagePath: "https://picsum.photos/150/120"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  lang.actor,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 90.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Director(
                        name: widget.model.cast?[index] ?? "",
                        imagePath: widget.model.castImages?[index] ?? ""),
                    itemCount: widget.model.cast?.length ?? 0,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  lang.cinema,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 24.sp),
                ),
                SizedBox(
                  height: 25.h,
                ),
                BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
                  listener: (context, state) {
                    if (state is GetCinemasSuccess) {
                      List temp = state.cinemas;
                      if (widget.cinema != "") {
                        if (temp.contains(cinemas[0])) {
                          cinemas = temp;
                        }
                      } else {
                        cinemas.addAll(temp);
                      }
                      cinemas.add("testCinema");
                      selectedCinema = cinemas[0];

                    }
                  },
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cinemas.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: CinemaCard(
                          onTap: () {
                            setState(() {
                              selectedCinema = cinemas[index];
                            });
                          },
                          title: cinemas[index],
                          imageUrl: 'assets/images/cgv.png',
                          isSelected:
                              cinemas[index] == selectedCinema ? true : false,
                        ),
                      ),
                    );
                  },
                ),
                ButtonBuilder(
                  width: 250.w,
                  height: 55.h,
                  image: HiveStorage.get(HiveKeys.isArabic)
                      ? "assets/images/continue_arabic.png"
                      : "assets/images/img_4.png",
                  text: "",
                  onTap: () {
                    if (HiveStorage.get(HiveKeys.role) ==
                        Role.guest.toString()) {
                      DialogUtils.showMessage(
                          context, "You Have To Sign In To Continue",
                          isCancelable: false,
                          posActionTitle: lang.sign_in,
                          negActionTitle: lang.cancel, posAction: () {
                        HiveStorage.set(HiveKeys.role, "");

                        navigateAndRemoveUntil(
                          context: context,
                          screen: const SignIn(),
                        );
                      }, negAction: () {
                        navigatePop(context: context);
                      });
                    } else {
                      if (selectedCinema != "") {
                        navigateTo(context: context, screen: SelectSeat());
                      } else {
                        showCenteredSnackBar(
                            context, 'please  Select Cinema first ');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 51.h,
                )
              ],
            ),
          ),
        ])));
  }
}

class VideoLauncher {
  static Future<void> launchYouTubeVideo(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $videoUrl';
    }
  }
}
//
// PayMobPayment().payWithPayMob(100).then(
// (value) {
// AppLogs.scussessLog("payment token: $value");
// navigateTo(
// context: context,
// screen: PaymentScreen(paymentToken: value ?? ""));
// },
// );