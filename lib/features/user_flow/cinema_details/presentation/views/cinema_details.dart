import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../movie_details/presentation/cubit/movie_details_cubit.dart';
import '../cubit/cinema_cubit.dart';
import '../cubit/cinema_state.dart';
import '../widgets/cinema_comments.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../widgets/cinema_description.dart';
import '../widgets/cinema_movies.dart';


class CinemaDetails extends StatefulWidget {
  final String cinemaId;

  const CinemaDetails({super.key, required this.cinemaId});

  @override
  State<CinemaDetails> createState() => _CinemaDetailsState();
}

class _CinemaDetailsState extends State<CinemaDetails> {
  void initState() {
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);

    return ScaffoldF(
      body: BlocProvider(
        create: (context) => CinemaCubit()..fetchCinemaDetails(widget.cinemaId),
        child: BlocBuilder<CinemaCubit, CinemaState>(
          builder: (context, state) {
            if (state is CinemaLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CinemaError) {
              return Center(child: Text(state.message));
            } else if (state is CinemaLoaded) {
              final cinemaData = state.cinemaData; // ✅ تعريف cinemaData هنا

              return SingleChildScrollView(
                child: Column(
                  children: [
                    /// ✅ **إضافة CinemaHeaderDescription هنا وتمرير بيانات السينما**
                    CinemaHeaderDescription(cinemaData: cinemaData),

                    Padding(
                      padding: EdgeInsets.only(top: 55.0.sp),
                      child: Text(
                        lang.movies,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
                      ),
                    ),
                    SizedBox(height: 400.h, child: CinemaMovies(cinemaId: widget.cinemaId)),
                    Padding(
                      padding: EdgeInsets.all(10.0.sp),
                      child: Text(
                        lang.comments,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 25.sp),
                      ),
                    ),
                    BlocProvider(
                      create: (context) => CinemaCubit()..fetchCinemaComments(widget.cinemaId),
                      child: BlocBuilder<CinemaCubit, CinemaState>(
                        builder: (context, state) {
                          if (state is CinemaLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is CinemaCommentsLoaded) {
                            final comments = state.comments;

                            if (comments.isEmpty) {
                              return Center(
                                child: Text(
                                  'لا توجد تعليقات بعد.',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
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
                            );
                          } else if (state is CinemaError) {
                            return Center(
                              child: Text(
                                state.message,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0.sp),
                          child: TextFormFieldBuilder(
                            controller: context.read<CinemaCubit>().getCommentController,
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
                          onPressed: () {
                            context.read<CinemaCubit>().addComment(
                                widget.cinemaId, context, lang.signin, lang.cancel, context.read<CinemaCubit>().getCommentController);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
