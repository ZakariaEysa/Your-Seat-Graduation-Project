import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../../../../data/hive_keys.dart';
import '../../../../data/hive_stroage.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/app_logs.dart';
import '../../../../widgets/app_bar/head_appbar.dart';
import '../../../../widgets/scaffold/scaffold_f.dart';
import '../widgets/date.dart';
import '../widgets/time.dart';
import '../widgets/left.dart';
import '../widgets/right.dart';
import '../widgets/seatsType.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({super.key});

  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  int _totalPrice = 0;
  List timesList = [];
  List<dynamic> times = [];
  List<dynamic> dates = [];
  List<int> days = [];
  List<int> months = [];
  String _seatCategory = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchMovieTimes("Point 90 Cinema", "Terap El-Mas");
  } // متغير لتحديد فئة المقعد

  void _updateTotalPrice(int priceChange) {
    setState(() {
      _totalPrice += priceChange;
    });
  }

  void _updateSeatCategory(int row) {
    setState(() {
      if (row < 2) {
        _seatCategory = "VIP";
      } else if (row < 4) {
        _seatCategory = "Premium";
      } else {
        _seatCategory = "Standard";
      }
    });
  }

  // Future<void> _fetchMovieTimes(String cinemaId, String movieName) async {
  //   try {
  //     // جلب بيانات السينما المحددة باستخدام cinemaId
  //     var docSnapshot = await FirebaseFirestore.instance
  //         .collection('Cinemas')
  //         .doc(cinemaId)
  //         .get();
  //
  //     if (docSnapshot.exists) {
  //       // تحويل البيانات القادمة من Firestore إلى Map
  //       Map<String, dynamic>? cinemaData = docSnapshot.data();
  //
  //       if (cinemaData != null && cinemaData.containsKey('movies')) {
  //         List<dynamic> moviesList = List.from(cinemaData['movies']);
  //
  //         // البحث عن الفيلم الذي يطابق movieName
  //         var selectedMovie = moviesList.firstWhere(
  //               (movie) => movie['name'] == movieName,
  //           orElse: () => null, // إذا لم يتم العثور على الفيلم
  //         );
  //
  //         if (selectedMovie != null) {
  //           AppLogs.scussessLog("Movie '$movieName' found!");
  //           // print("Movie details: $selectedMovie");
  //           // print("Movie details: ${selectedMovie['times']}");
  //
  //           setState(() {
  //             timesList = selectedMovie['times'];
  //             times = timesList.map((e) => e['time']).toList();
  //           });
  //           print(selectedMovie['times'].toString());
  //           print(times);
  //         } else {
  //           print("Movie '$movieName' not found in cinema $cinemaId.");
  //         }
  //       } else {
  //         print("No movies found in cinema $cinemaId.");
  //       }
  //     }
  //     else {
  //       print("No cinema found with ID: $cinemaId");
  //     }
  //     AppLogs.scussessLog("message");
  //     print(timesList);
  //     print(movieName);
  //   } catch (e) {
  //     print("Error fetching movies data: $e");
  //   }
  // }

  Future<void> _fetchMovieTimes(String cinemaId, String movieName) async {
    try {
      var docSnapshot = await FirebaseFirestore.instance
          .collection('Cinemas')
          .doc(cinemaId)
          .get();

      if (docSnapshot.exists) {
        Map<String, dynamic>? cinemaData = docSnapshot.data();

        if (cinemaData != null && cinemaData.containsKey('movies')) {
          List<dynamic> moviesList = List.from(cinemaData['movies']);

          var selectedMovie = moviesList.firstWhere(
                (movie) => movie['name'] == movieName,
            orElse: () => null,
          );

          if (selectedMovie != null) {
            AppLogs.scussessLog("Movie '$movieName' found!");

            setState(() {
              timesList = selectedMovie['times'];
              times = timesList.map((e) => e['time']).toList();
              dates = timesList.map((e) => e['date']).toList();

              days = dates.map((date) =>
              DateTime
                  .parse(date)
                  .day).toList();
              months = dates.map((date) =>
              DateTime
                  .parse(date)
                  .month).toList();
            });

            print(selectedMovie['times'].toString());
            print("Times: $times");
            print("Dates: $dates");
            print("Days: $days");
            print("Months: $months"); // طباعة الـ dates للتحقق
          } else {
            print("Movie '$movieName' not found in cinema $cinemaId.");
          }
        } else {
          print("No movies found in cinema $cinemaId.");
        }
      } else {
        print("No cinema found with ID: $cinemaId");
      }

      AppLogs.scussessLog("message");
      print(timesList);
      print(movieName);
    } catch (e) {
      print("Error fetching movies data: $e");
    }
  }

  int _selectedTimeIndex = 1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => navigatePop(context: context),
        ),
        backgroundColor: theme.primaryColor,
        title: Padding(
          padding: EdgeInsets.only(left: 31.w, bottom: 15.h),
          child: HeadAppBar(title: lang.selectSeat),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 333.w,
              height: 3.h,
              color: const Color(0xFFF834FC),
            ),
            Center(
              child: Image.asset(
                "assets/images/shadwo.png",
                width: double.infinity,
                height: 50.h,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10.w),
                Left(
                  updateTotalPrice: _updateTotalPrice,
                  updateSeatCategory: _updateSeatCategory,
                ),
                SizedBox(width: 12.w),
                Right(
                  updateTotalPrice: _updateTotalPrice,
                  updateSeatCategory: _updateSeatCategory,
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                seatsType(color: const Color(0xFFF3F3F3), text: lang.available),
                seatsType(color: const Color(0xFF5b085d), text: lang.reserved),
                seatsType(color: const Color(0xFF09FBD3), text: lang.selected),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Image.asset(
                  HiveStorage.get(HiveKeys.isArabic)
                      ? "assets/images/leftHand.png"
                      : "assets/images/HandRight.png",
                  width: 50.w,
                  height: 25.h,
                ),
                Text(
                  _seatCategory.isNotEmpty
                      ? "The selected seat is $_seatCategory"
                      : "No seat selected",
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Center(
              child: Text(
                lang.selectDateTime,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            /**/
            Date(days: days,months: months,),
            SizedBox(
              height: 30.h,
            ),
            Time(times: times)
            ,
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.total,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontSize: 20.sp),
                      ),
                      Text(
                        "$_totalPrice EGP",
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 20.sp,
                          color: const Color(0xFF09FBD3),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF09FBD3),
                      minimumSize: Size(155.w, 42.h),
                    ),
                    child: Text(
                      lang.buyTicket,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 19.sp,
                        color: Colors.black,
                      ),
                    ),
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


