import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/views/payment_policy.dart';
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
  List<Map<String, dynamic>> timesList = [];
  List<String> dates = [];
  List<int> days = [];
  List<int> months = [];
  String _seatCategory = ''; // ✅ استعادة متغير فئة التذكرة

  int? _selectedDay;
  List<String> filteredTimes = [];
  String? _selectedTime;

  @override
  void initState() {
    super.initState();
    _fetchMovieTimes("Point 90 Cinema", "Terap El-Mas");
  }

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
              timesList =
                  List<Map<String, dynamic>>.from(selectedMovie['times']);
              dates = timesList.map((e) => e['date'].toString()).toList();
              days = dates.map((date) => DateTime.parse(date).day).toList();
              months = dates.map((date) => DateTime.parse(date).month).toList();

              if (days.isNotEmpty) {
                _selectedDay = days.first;
                _filterTimesForSelectedDay();
              } else {
                _selectedDay = null;
                filteredTimes = [];
                _selectedTime = null;
              }
            });
          } else {
            print("Movie '$movieName' not found in cinema $cinemaId.");
          }
        } else {
          print("No movies found in cinema $cinemaId.");
        }
      } else {
        print("No cinema found with ID: $cinemaId");
      }
    } catch (e) {
      print("Error fetching movies data: $e");
    }
  }

  /// دالة لتصفية الأوقات بناءً على اليوم المحدد
  void _filterTimesForSelectedDay() {
    if (_selectedDay != null) {
      AppLogs.scussessLog(timesList.toString());
      setState(() {
        filteredTimes = timesList
            .where((e) => DateTime.parse(e['date']).day == _selectedDay)
            .expand((e) => e['time'] is List
                ? List<String>.from(e['time'])
                : [e['time'].toString()])
            .toList();

        _selectedTime = filteredTimes.isNotEmpty ? filteredTimes.first : null;
      });
    } else {
      setState(() {
        filteredTimes = [];
        _selectedTime = null;
      });
    }
  }

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
                  updateSeatCategory:
                      _updateSeatCategory, // ✅ تحديث نوع التذكرة عند اختيار المقعد
                ),
                SizedBox(width: 12.w),
                Right(
                  updateTotalPrice: _updateTotalPrice,
                  updateSeatCategory:
                      _updateSeatCategory, // ✅ تحديث نوع التذكرة عند اختيار المقعد
                ),
              ],
            ),
            SizedBox(height: 25.h),

            // ✅ عرض نوع التذكرة المختارة
            Text(
              _seatCategory.isNotEmpty
                  ? "The selected seat is $_seatCategory"
                  : "No seat selected",
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 18.sp),
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

            Date(
              days: days,
              months: months,
              selectedDay: _selectedDay ?? (days.isNotEmpty ? days.first : 1),
              onDaySelected: (newDay) {
                setState(() {
                  _selectedDay = newDay;
                  _filterTimesForSelectedDay();
                });
              },
            ),
            SizedBox(height: 30.h),

            Time(
              times: filteredTimes.isNotEmpty ? filteredTimes : [],
              selectedTime: _selectedTime,
              onTimeSelected: (newTime) {
                AppLogs.scussessLog(newTime);
                setState(() {
                  _selectedTime = newTime;
                });
              },
            ),

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
                    onPressed: () {
                      navigateTo(context: context, screen: PaymentPolicy());
                    },
                    child: Text(lang.buyTicket),
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
