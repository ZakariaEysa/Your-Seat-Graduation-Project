import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/loading_indicator.dart';
import '../cubit/cinema_cubit.dart';
import '../cubit/cinema_state.dart';
import '../widgets/cinema_comments.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/cinema_description.dart';
import '../widgets/cinema_fetch_comment.dart';
import '../widgets/cinema_movies.dart';

class CinemaDetails extends StatefulWidget {
  final Map<String, dynamic> cinemaModel;

  const CinemaDetails({super.key, required this.cinemaModel});

  @override
  State<CinemaDetails> createState() => _CinemaDetailsState();
}

class _CinemaDetailsState extends State<CinemaDetails> {
  @override
  void initState() {
    super.initState();
    CinemaCubit.get(context).fetchCinemaComments(widget.cinemaModel['name']);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);

    return ScaffoldF(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CinemaHeaderDescription this is cover and description
            CinemaHeaderDescription(cinemaData: widget.cinemaModel),
            // Padding Contains text movies
            Padding(
              padding: EdgeInsets.only(top: 55.0.sp),
              child: Text(
                lang.moviess,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
              ),
            ),
            SizedBox(
              height: 400.h,
              child: CinemaMovies(movies: widget.cinemaModel['movies']),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Text(
                lang.comments,
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
              ),
            ),
            // BlocBuilder  Contains fetch comments form firebase
            CinemaFetchComment(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: TextFormField(
                      controller: context.read<CinemaCubit>().getCommentController,
                      keyboardType: TextInputType.multiline, // دعم النصوص متعددة الأسطر
                      maxLines: null, // يسمح بعدد غير محدود من الأسطر
                      decoration: InputDecoration(
                        hintText: lang.addComment,
                        hintStyle: TextStyle(color: Colors.white70 , fontSize: 18),// سيختفي عند الكتابة
                        filled: true,
                        fillColor:Theme.of(context).colorScheme.primaryContainer, // لون الخلفية
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white , fontSize: 18 ), // لون النص داخل الحقل
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: BlocBuilder<CinemaCubit, CinemaState>(
                    builder: (context, state) {
                      bool isAdding = CinemaCubit.get(context).isAddingComment;
                      return IconButton(
                        icon: Icon(Icons.send, color: Theme.of(context).colorScheme.onPrimary, size:28.sp),
                        onPressed: isAdding
                            ? null
                            : () async {
                          await CinemaCubit.get(context).addComment(
                            widget.cinemaModel['name'],
                            context,
                            lang.signin,
                            lang.cancel,
                            context.read<CinemaCubit>().getCommentController,
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(width: 18.w),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
