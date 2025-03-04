import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/cinema_details/presentation/views/cinema_details.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/Widget/search/search_cubit/search_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/model/movies_details_model/movies_details_model.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/presentation/views/movie_details.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../widgets/network_image/image_replacer.dart';
import '../../../../movie_details/data/model/movies_details_model/crew.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      context.read<SearchCubit>().fetchData(_controller.text);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2B1269),
        body: Padding(
          padding: EdgeInsets.all(14.0.w),
          child: Column(
            children: [
              TextFormField(
                focusNode: _focusNode,
                controller: _controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0.r),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      navigatePop(context: context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Icon(Icons.cancel_rounded, color: Colors.white70),
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Icon(Icons.search, color: Colors.white70),
                  ),
                  hintText: lang.search,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SearchSuccess) {
                      if (state.data.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 17.0),
                            child: Text(
                              lang.noResultsFound,
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          final result = state.data[index];
                          return Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: InkWell(
                              onTap: () {
                                AppLogs.scussessLog(result.toString());
                                if (result['id'].toString().contains('Cinema')) {
                                 navigateTo(
                                   context: context,
                                   screen: CinemaDetails(cinemaModel: result ,),
                                 );
                                } else {

                                  navigateTo(
                                    context: context,
                                    screen: MovieDetails(
                                      model: MoviesDetailsModel(
                                        name: result['name'],
                                        castImages: result['cast_images'],
                                        ageRating: result['ageRating'],
                                        cast: result['cast'],
                                        category: result['category'],
                                        crew: Crew(
                                          director: result['crew']['director'],
                                          producer: result['crew']['producer'],
                                          writer: result['crew']['writer'],
                                        ),
                                        description: result['description'],
                                        duration: result['duration'],
                                        language: result['language'],
                                        posterImage: result['poster_image'],
                                        rating: result['rating'],
                                        releaseDate: result['releaseDate'],
                                        trailer: result['trailer'],
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0.r),
                                      child: ImageReplacer(
                                        imageUrl: result['poster_image'] ??
                                            'https://via.placeholder.com/50',
                                        width: 80.w,
                                        height: 100.h,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            result['name'] ??
                                                result['title'] ??
                                                'Unknown',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            result['category'] ?? 'Cinema',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            children: [
                                              Text(
                                                result['rating']?.toString() ?? 'Unknown',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(width: 5.w),
                                              Icon(Icons.star,
                                                  color: Colors.yellow, size: 17.sp),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is SearchError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    }
                    return Center(child: Text(lang.noResultsFound, style: TextStyle(color: Colors.white70)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





