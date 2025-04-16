import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../cubit/cinema_cubit.dart';
import '../cubit/cinema_state.dart';
import 'cinema_comments.dart';

class CinemaFetchComment extends StatelessWidget {
   CinemaFetchComment({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return     BlocBuilder<CinemaCubit, CinemaState>(
      builder: (context, state) {
        if (state is CinemaCommentsLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is CinemaCommentsError) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        } else if (state is CinemaCommentsLoaded) {
          final comments = state.comments;

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
                      name: comment['userName']??"",
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
                  child: Text(
                    "Show More..",
                    style: TextStyle(color: Color(0xFFCF4FDD)),
                  ),
                ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
