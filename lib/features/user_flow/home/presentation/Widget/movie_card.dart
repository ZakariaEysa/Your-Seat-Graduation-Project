// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class MovieCard extends StatelessWidget {
//   final int index;
//   final int currentPage;
//   MovieCard({super.key, required this.index, required this.currentPage});
//
//   final List<String> movieImages = [
//     'assets/images/Guardians.png', // Guardians of the Galaxy
//     'assets/images/film1.png', // Avengers Infinity War
//     'assets/images/Batman.png', // Batman v Superman
//   ];
//
//   final List<Map<String, String>> movieDetails = [
//     {
//       'title': 'Guardians of the Galaxy',
//       'duration': '2h05m',
//       'genre': 'Action, adventure, sci-fi',
//       'rating': '4.6 (987)',
//     },
//     {
//       'title': 'Avengers - Infinity War',
//       'duration': '2h29m',
//       'genre': 'Action, adventure, sci-fi',
//       'rating': '4.8 (1,222)',
//     },
//     {
//       'title': 'Batman v Superman',
//       'duration': '2h31m',
//       'genre': 'Action, adventure, fantasy',
//       'rating': '4.5 (876)',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//             child: Image.asset(
//               movieImages[index],
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(height: 10.h),
//
//           // Movie title
//           Text(
//             movieDetails[index]['title']!,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           // Duration and genre
//           Text(
//             '${movieDetails[index]['duration']} • ${movieDetails[index]['genre']}',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 10.sp,
//               color: Colors.white70,
//             ),
//           ),
//           // Rating
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.star, color: Colors.yellow, size: 16),
//               SizedBox(width: 4.w),
//               Text(
//                 movieDetails[index]['rating']!,
//                 style: TextStyle(
//                   fontSize: 10.sp,
//                   color: Colors.white70,
//                 ),
//               ),
//             ],
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieCard extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Movie Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              movie['poster_image'] ?? 'https://via.placeholder.com/300',
              fit: BoxFit.cover,
              height: 350.h,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 350.sp,
                  width: 250.sp,
                  color: Colors.grey.shade800,
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),

          // Movie Title
          Text(
            movie['name'] ?? 'Unknown Title',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          // Duration and Category
          Text(
            '${movie['duration'] ?? 'N/A'} • ${movie['category'] ?? 'Unknown'}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white70,
            ),
          ),

          // Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 16),
              SizedBox(width: 4.w),
              Text(
                '${movie['rating'] ?? 'N/A'}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
