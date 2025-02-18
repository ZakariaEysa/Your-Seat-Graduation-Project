import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../utils/app_logs.dart';
import '../../../../../utils/dialog_utilits.dart';
import '../../../auth/presentation/views/sign_in.dart';
import '../widgets/cinema_comments.dart';

import '../../../home/presentation/views/home_layout.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../widgets/cinema_movies.dart';

class CinemaDetails extends StatefulWidget {
  final String cinemaId;

  const CinemaDetails({super.key, required this.cinemaId});

  @override
  State<CinemaDetails> createState() => _CinemaDetailsState();
}

class _CinemaDetailsState extends State<CinemaDetails> {
  final TextEditingController _commentController = TextEditingController();
  var currentUser;


  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    var lang = S.of(context);
    void _addComment() async {
      if(          HiveStorage.get(HiveKeys.role)==Role.guest.toString()      ){

        DialogUtils.showMessage(context, "You Have To Sign In To Continue",
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



      }
      else {

        if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {
          currentUser = HiveStorage.getGoogleUser();
        } else {
          currentUser = HiveStorage.getDefaultUser();
        }

        if (_commentController.text.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection('Cinemas')
              .doc(widget.cinemaId)  // تحديد السينما المطلوبة
              .collection('comments') // إضافة التعليق داخل مجموعة التعليقات الخاصة بهذه السينما
              .add({
            'text': _commentController.text,
            'timestamp': FieldValue.serverTimestamp(),
            'userName': currentUser.name,
            'image': currentUser.image,
          });

          _commentController.clear();
        }



      }

    }


    return ScaffoldF(
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('Cinemas').doc(widget.cinemaId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("لم يتم العثور على تفاصيل السينما"));
          }

          final cinemaData = snapshot.data!;
          final cinemaName = cinemaData['name'] ?? 'Cinema';
          final description = cinemaData['description'] ?? 'لا يوجد وصف متاح';
          final imageUrl = cinemaData['poster_image'] ?? '';
          final rating = cinemaData['rating'] ?? 0.0;  // استرجاع التقييم
          final ratingCount = cinemaData['rating_count'] ?? 0;  // استرجاع عدد التقييمات

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none, // يسمح بخروج جزء من العنصر خارج الـ Stack
                  children: [
                    imageUrl.isNotEmpty
                        ? Image.network(
                      imageUrl,
                      width: 450.w,
                      height: 250.h,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      width: 450.w,
                      height: 390.h,
                      color: Colors.grey,
                      child: const Icon(Icons.image, color: Colors.white),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: IconButton(
                        onPressed: () {
                          navigateTo(context: context, screen: const HomeLayout());
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
                      ),
                    ),

                    // جزء التفاصيل الذي يمتد خارج الصورة
                    Positioned(
                      bottom: -50.h, // يخرج جزء من الـ Container خارج الصورة
                      left: 20.w,
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        color: const Color(0xFF37313B).withOpacity(.9),
                        width: 340.w,
                        height: 180.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cinemaName,
                              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              description,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 11.sp,
                                color: const Color(0xFFD4D0D0),
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Text(
                                  lang.review,
                                  textAlign: TextAlign.start,
                                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
                                ),
                                SizedBox(width: 10.w),
                                Image.asset(
                                  'assets/images/cinemastar.png',
                                  width: 12.w,
                                  height: 11.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  '$rating ($ratingCount)',
                                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 11.sp),
                                ),
                              ],
                            ),
                            RatingBar.builder(
                              initialRating: rating,
                              minRating: 1,
                              unratedColor: const Color(0xFF575757),
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              itemSize: 33,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, index) {
                                return Icon(
                                  rating >= index + 1 ? Icons.star : Icons.star_border,
                                  size: 2,
                                  color: rating >= index + 1 ? const Color(0xFFCCC919) : const Color(0xFF575757),
                                );
                              },
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 55.0.sp),
                  child: Text(
                    lang.movies,
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
                  ),
                ),
                SizedBox(height: 400.h, child: CinemaMovies(cinemaId: widget.cinemaId,)),
                Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Text(
                    lang.comments,
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Cinemas')
                      .doc(widget.cinemaId)
                      .collection('comments')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text(
                          'لا توجد تعليقات بعد.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      );
                    }
                    return Column(
                      children: snapshot.data!.docs.map((doc) {
                        return Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: CinemaComments(
                            name: doc['userName'],
                            image: doc['image'],
                            title: doc['text'],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0.sp),
                      child: TextFormFieldBuilder(
                        controller: _commentController,
                        type: TextInputType.text,
                        width: 270.w,
                        height: 45.h,
                        color: const Color(0xFF110C3B),
                        obsecure: false,
                        label: lang.addComment,
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: _addComment,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
