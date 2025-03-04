import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/network_image/image_replacer.dart';
import '../../../cinema_details/presentation/views/cinema_details.dart';

class CinemaItem extends StatelessWidget {
  const CinemaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Cinemas').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final cinemas = snapshot.data!.docs; // الاحتفاظ بالبيانات الأصلية

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cinemas.length,
            itemBuilder: (context, index) {
              final cinema = cinemas[index]; // بيانات السينما الأصلية
              final data = cinema.data() as Map<String, dynamic>; // تحويل البيانات إلى Map
              final name = data["name"] ?? "Cinema";
              final imageUrl = data["poster_image"] ?? "";

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateTo(
                          context: context,
                          screen: CinemaDetails(cinemaModel: data), // ✅ تمرير البيانات الأصلية
                        );
                      },
                      child: ImageReplacer(
                        imageUrl: imageUrl,
                        fit: BoxFit.fill,
                        isCircle: true,
                        width: 140.w,
                        height: 140.h,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
