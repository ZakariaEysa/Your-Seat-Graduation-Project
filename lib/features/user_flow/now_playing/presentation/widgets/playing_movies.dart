import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/model/movies_details_model/movies_details_model.dart';

import '../../../../../generated/l10n.dart';
import '../../../Watch_list/favorite_movies_provider/favorite_movies_provider.dart';
import '../views/coming_soon.dart';

class PlayingMovies extends StatefulWidget {
  final String image;
  final String title;
  final String category;
  final String duration;
  final String rate;
   final MoviesDetailsModel movies;



  const PlayingMovies({
    super.key,
    required this.image,
    required this.title,
    required this.category, required this.duration, required this.rate,
    required this.movies,
  });




  @override
  State<PlayingMovies> createState() => _PlayingMoviesState();
}


class _PlayingMoviesState extends State<PlayingMovies> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // تحقق إذا كان الفيلم موجودًا في قائمة Watchlist
    final favoriteMoviesProvider =
    Provider.of<FavoriteMoviesProvider>(context, listen: false);
    _isBookmarked =
        favoriteMoviesProvider.favoriteMovies.contains(widget.movies);
  }
  bool _isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(right: 8.w, left: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Prevent unnecessary stretching
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
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
                  height: 260.sp,
                  width: 250.sp,
                  color: Colors.grey.shade800,
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 50,
                  ),
                );
              },
              widget.image,
              width: 200.w,
              height: 250.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.title,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/cinemastar.png",
                width: 17.w,
                height: 18.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.rate,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!_isBookmarked) {
                      Provider.of<FavoriteMoviesProvider>(context, listen: false).addMovie(widget.movies);
                      print("Added to favorites: ${widget.movies.name}");
                    } else {
                      Provider.of<FavoriteMoviesProvider>(context, listen: false).removeMovie(widget.movies);
                      print("Removed from favorites: ${widget.movies.name}");
                    }
                    _isBookmarked = !_isBookmarked;
                  });
                },
                child: Icon(
                  Icons.bookmark,
                  color: _isBookmarked
                      ? Colors.purple
                      : Colors.grey.withOpacity(0.15),
                  size: 30.sp,
                ),
              ),
            ],
          ),
          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/clock.png",
                width: 18.w,
                height: 18.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.duration,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/video.png",
                width: 18.w,
                height: 18.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.category,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
