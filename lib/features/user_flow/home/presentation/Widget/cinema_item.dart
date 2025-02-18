import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/navigation.dart';
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
            return const Center(child: Text("لا توجد سينمات متاحة"));
          }

          final cinemas = snapshot.data!.docs;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cinemas.length,
            itemBuilder: (context, index) {
              final cinema = cinemas[index];
              final cinemaId = cinema.id;
              final name = cinema['name'] ?? 'Cinema';
              final imageUrl = cinema['poster_image'] ?? '';

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateTo(
                          context: context,
                          screen: CinemaDetails(cinemaId: cinemaId),
                        );
                      },
                      child: ClipOval(
                        child: imageUrl.isNotEmpty
                            ? Image.network(
                          imageUrl,
                          height: 120.h,
                          width: 120.w,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              height: 120.h,
                              width: 120.w,
                              child: const Center(child: CircularProgressIndicator()),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 120.h,
                              width: 120.w,
                              color: Colors.grey,
                              child: const Icon(Icons.error, color: Colors.red),
                            );
                          },
                        )
                            : Container(
                          height: 120.h,
                          width: 120.w,
                          color: Colors.grey,
                          child: const Icon(Icons.image, color: Colors.white),
                        ),
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
