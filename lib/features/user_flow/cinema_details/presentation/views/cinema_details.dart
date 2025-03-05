import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/now_playing/presentation/views/coming_soon.dart';
import 'package:yourseatgraduationproject/widgets/loading_indicator.dart';
import '../../../../../utils/app_logs.dart';
import '../cubit/cinema_cubit.dart';
import '../cubit/cinema_state.dart';
import '../widgets/cinema_comments.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../widgets/cinema_description.dart';
import '../widgets/cinema_movies.dart';

class CinemaDetails extends StatefulWidget {
  final  Map<String , dynamic> cinemaModel;

   CinemaDetails({super.key, required this.cinemaModel });

  @override
  State<CinemaDetails> createState() => _CinemaDetailsState();
}

class _CinemaDetailsState extends State<CinemaDetails> {
  @override
  void initState() {
    super.initState();
   // CinemaCubit.get(context).fetchCinemaDetails(widget.cinemaId);
    CinemaCubit.get(context).fetchCinemaComments(widget.cinemaModel['name']);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);


    return ScaffoldF(

      body:  SingleChildScrollView(
      child: Column(
        children: [

          CinemaHeaderDescription(cinemaData: widget.cinemaModel),
          Padding(
            padding: EdgeInsets.only(top: 55.0.sp),
            child: Text(
              lang.moviess,
              style:
              theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
            ),
          ),
          SizedBox(
              height: 400.h,
              child: CinemaMovies( movies: widget.cinemaModel['movies'],)),
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Text(
              lang.comments,
              style:
              theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
            ),
          ),
          BlocBuilder<CinemaCubit, CinemaState>(
            builder: (context, state) {
              AppLogs.scussessLog(state.toString());
              if (state is CinemaCommentsLoading) {

                return const Center(child: LoadingIndicator());
              } else if (state is CinemaCommentsError) {
                return Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              } else if (state is CinemaCommentsLoaded ||
                  CinemaCubit.get(context).commentsList.isNotEmpty) {
                final comments = CinemaCubit.get(context).commentsList;

                if (comments.isEmpty) {
                  return Center(
                    child: Text(
                      lang.Therearenocommentsyet,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }

                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CinemaComments(
                            name: comment['userName'],
                            image: comment['image'],
                            title: comment['text'],
                          ),
                        );
                      },
                    ),


                    if (comments.length < CinemaCubit.get(context).allComments.length)
                      TextButton(
                        onPressed: () {
                          CinemaCubit.get(context).loadMoreComments();
                        },
                        child: Text("Show More.." , style: TextStyle(
                            color: Color(0xFFCF4FDD)
                        ),),
                      ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }

            },
          ),

          Row(
            children: [

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.sp), // استخدام .sp لجعل التباعد متجاوبًا
                  child: TextFormFieldBuilder(
                    controller: context.read<CinemaCubit>().getCommentController,
                    type: TextInputType.text,
                    width: double.infinity, // استخدام `double.infinity` لجعله يتمدد تلقائيًا
                    height: 45.h, // استخدام .h لجعل الارتفاع متجاوبًا
                    color: const Color(0xFF110C3B),
                    obsecure: false,
                    label: lang.addComment,
                  ),
                ),
              ),

              /// ✅ التباعد بين العناصر (متجاوب)
              SizedBox(width: 10.w),

              /// ✅ زر الإرسال (متجاوب)
              Container(
                width: 50.w, // استخدام .w لجعل الحجم متجاوبًا
                height: 45.h, // استخدام .h لجعل الحجم متجاوبًا
                decoration: BoxDecoration(
                  color: Color(0xFF110C3B),
                  borderRadius: BorderRadius.circular(12.r), // استخدام .r لتكبير الحواف بشكل متناسق
                ),
                child: IconButton(
                  icon: Icon(Icons.send, color: Colors.white, size: 20.sp),
                  onPressed: () async {
                    await CinemaCubit.get(context).addComment(
                      widget.cinemaModel['name'],
                      context,
                      lang.signin,
                      lang.cancel,
                      context.read<CinemaCubit>().getCommentController,
                    );

                    await CinemaCubit.get(context).fetchCinemaComments(widget.cinemaModel['name']);
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
}}