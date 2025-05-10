import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/chat_message_model.dart';

class ChatMessageItem extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUser = message.type == MessageType.user;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(maxWidth: 270.w),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isUser ? Colors.purple[300] : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.message,
                style: TextStyle(
                  color: isUser ? Colors.white : const Color(0xFF27125B),
                  fontSize: 14.sp,
                ),
              ),
              if (message.recommendations != null &&
                  message.recommendations!.isNotEmpty)
                ..._buildRecommendations(message.recommendations!, theme),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRecommendations(
      List<MovieRecommendation> recommendations, ThemeData theme) {
    return [
      SizedBox(height: 8.h),
      Divider(color: Colors.grey[300], thickness: 1),
      SizedBox(height: 8.h),
      Text(
        'التوصيات:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          color: const Color(0xFF27125B),
        ),
      ),
      SizedBox(height: 4.h),
      ...recommendations.map((movie) => _buildMovieItem(movie, theme)),
    ];
  }

  Widget _buildMovieItem(MovieRecommendation movie, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              color: const Color(0xFF27125B),
            ),
          ),
          Text(
            '${movie.genre} • ${movie.releaseYear} • ${movie.imdbScore}/10',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[700],
            ),
          ),
          Text(
            'المخرج: ${movie.director}',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[700],
            ),
          ),
          Text(
            'الممثلين: ${movie.cast.join(", ")}',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
