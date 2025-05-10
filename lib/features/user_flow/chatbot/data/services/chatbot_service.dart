import 'package:dio/dio.dart';
import 'package:yourseatgraduationproject/core/Network/end_points.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import '../../../../../core/Network/api_service.dart';
import '../models/chat_message_model.dart';

class ChatbotService {
  final ApiService _apiService = ApiService(dio: Dio());

  Future<Map<String, dynamic>> sendMessage(String message) async {
    try {
      AppLogs.debugLog('Sending message: $message');
      final response = await _apiService.postWithoutToken(
        endPoint: '/recommend',
        body: {'message': message},
      );

      AppLogs.scussessLog(response.toString());
      AppLogs.scussessLog(response.statusCode.toString());
      AppLogs.scussessLog(response.data.toString());

      return response.data;
    } catch (e) {
      AppLogs.errorLog('Error sending message: $e');
      rethrow;
    }
  }

  Future<ChatMessage> getRecommendations(String message) async {
    try {
      final jsonResponse = await sendMessage(message);

      final botMessage = jsonResponse['response']['bot'] as String;

      List<MovieRecommendation> recommendations = [];
      if (jsonResponse['response']['recommendations'] != null) {
        recommendations = (jsonResponse['response']['recommendations'] as List)
            .map((recommendation) =>
                MovieRecommendation.fromJson(recommendation))
            .toList();
      }

      return ChatMessage(
        message: botMessage,
        type: MessageType.bot,
        recommendations: recommendations,
      );
    } catch (e) {
      AppLogs.errorLog('Error getting recommendations: $e');
      return ChatMessage(
        message: 'Sorry, I encountered an error. Please try again later.',
        type: MessageType.bot,
      );
    }
  }
}
