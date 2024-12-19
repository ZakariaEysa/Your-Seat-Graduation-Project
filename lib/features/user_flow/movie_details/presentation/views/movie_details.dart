import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/widgets/director_actor_card.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../home/presentation/views/home_layout.dart';
import '../widgets/cinema_card.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key,});

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
            Image.asset(
              'assets/images/Rectangle 49 (4).png',
              width: 500.w,
              height: 390.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: IconButton(
                  onPressed: () {
                    navigateTo(context: context, screen: const HomeLayout());
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
                height: 170.h,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Avengers: Infinity War",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "2h29m • 16.12.2022",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 13.sp, color: const Color(0xFFD4D0D0)),
                      ),
                      SizedBox(height: 25.h),
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
                          Text('4.8 (1.222)',
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12.sp)),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating:4,
                            minRating: 1,
                            unratedColor: Color(0xFF575757),
                            ignoreGestures: true,
                            direction: Axis.horizontal,
                            itemSize: 35,
                            //allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              size: 2,
                              color:Color(0xFFCCC919),
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          TextButton.icon(
                              onPressed: () {},
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
                                      const Color(0xFF2C113D).withOpacity(.91)),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side:
                                          const BorderSide(color: Colors.white),
                                      // ... button styles
                                    ),
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h),
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
                      width: 35.w,
                    ),
                    Text(
                      "Action, adventure, sci-fi",
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
                      width: 35.w,
                    ),
                    Text(
                      " 13+ ",
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
                      width: 35.w,
                    ),
                    Text(
                      "    English ",
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
                  "As the Avengers and their allies have continued to\nprotect the world from threats too large for any\none hero to handle, a new danger has emerged\nfrom the cosmic shadows:Thanos...\nto protect the world from threats too large for\nany one hero to handle, a new danger has\nemerged from the cosmic shadows: Thanos....\nAs the Avengers and their allies have continued to\nAs the Avengers and their allies have continued to\nAs the Avengers and their allies have continued to  ",
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
                const Row(
                  children: [
                    Director(
                        name: "Anthony\nRusso",
                        imagePath: "assets/images/director1.png"),
                    Director(
                        name: "    Joe\n    Russo",
                        imagePath: "assets/images/director2.png"),
                  ],
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
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Director(
                          name: "Robert\nDowney Jr.",
                          imagePath: "assets/images/actor1.png"),
                      Director(
                          name: "Chris\nHemsworth",
                          imagePath: "assets/images/actor2.png"),
                      Director(
                          name: "Chris\nRobert",
                          imagePath: "assets/images/actor3.png"),
                    ],
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
                const CinemaCard(
                  title: 'Vincom Ocean Park CGV',
                  smalltitle: '4.55 km',
                  largetitle: 'Da Ton, Gia Lam, Ha Noi',
                  imageUrl: 'assets/images/cgv.png',
                ),
                SizedBox(
                  height: 25.h,
                ),
                const CinemaCard(
                  title: 'Aeon Mall CGV',
                  smalltitle: '9.32 km',
                  largetitle: '27 Co Linh, Long Bien, Ha Noi',
                  imageUrl: 'assets/images/cgv.png',
                ),
                SizedBox(
                  height: 25.h,
                ),
                const CinemaCard(
                  title: 'Lotte Cinema Long Bien',
                  smalltitle: '14.3 km',
                  largetitle: '7-9 Nguyen Van Linh, Long Bien, Ha Noi',
                  imageUrl: 'assets/images/lottr1.png',
                ),
                SizedBox(
                  height: 30.h,
                ),
                ButtonBuilder(
                  width: 270.w,
                  height: 55.h,
                  image: HiveStorage.get(HiveKeys.isArabic)
                      ? "assets/images/continue_arabic.png"
                      : "assets/images/Continue1.png",
                  text: "",
                  onTap: () {},
                ),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
          ),
        ])));
  }
}





// // إضافة كومنت لكل الأفلام في الكولكشن
// Future<void> addCommentToAllMovies() async {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   final List<Map<String, dynamic>> comments = [
//     {
//       'name': 'User1',
//       'comment': 'Great movie!',
//       'image': 'https://picsum.photos/',
//     },
//     {
//       'name': 'User2',
//       'comment': 'Loved the acting!',
//       'image': 'https://picsum.photos/',
//     },
//     {
//       'name': 'User3',
//       'comment': 'The storyline was fantastic.',
//       'image': 'https://picsum.photos/',
//     },
//   ];
//   // try {
//   //   // جلب كل الأفلام من الكولكشن
//   //   QuerySnapshot movieSnapshot = await _firestore.collection('movies').get();

//   //   // تنفيذ عملية إضافة الكومنت لكل فيلم
//   //   for (var doc in movieSnapshot.docs) {
//   //     String movieId = doc.id;
//   //     print(movieId);

//   //     // تحديث كل فيلم بإضافة الكومنت في قائمة "comments"
//   //     await _firestore.collection('movies').doc(movieId).update({
//   //       'comments': FieldValue.arrayUnion(comments), // إضافة الكومنتات للقائمة
//   //     });
//   //   }
//   //   print("Comment added to all movies successfully.");
//   // } catch (e) {
//   //   print("Error adding comment to all movies: $e");
//   // }

//   try {
//     // جلب كل الأفلام من الكولكشن 'movies'
//     QuerySnapshot movieSnapshot = await _firestore.collection('movies').get();

//     // طباعة كل فيلم
//     for (var doc in movieSnapshot.docs) {
//       print('Movie ID: ${doc.id}');
//       print('Movie Data: ${doc.data()}');
//     }
//   } catch (e) {
//     print("Error fetching movies: $e");
//   }
// }






















// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> addCommentToMovie(String movieId, String userName, String comment, String imageUrl) async {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final CollectionReference moviesCollection = firestore.collection('movies');

//   try {
//     // تحديد المستند بناءً على movieId
//     final DocumentReference movieDoc = moviesCollection.doc(movieId);

//     // تعليق جديد
//     final Map<String, dynamic> newComment = {
//       'name': userName,
//       'comment': comment,
//       'image': imageUrl,
//     };

//     // إضافة التعليق إلى قائمة التعليقات
//     await movieDoc.update({
//       'comments': FieldValue.arrayUnion([newComment]), // يستخدم arrayUnion لإضافة تعليق جديد بشكل آمن
//     });

//     print('Comment added successfully.');
//   } catch (e) {
//     print('Error adding comment: $e');
//   }
// }

