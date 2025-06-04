import 'package:dio/dio.dart';
import '../../../../../core/Network/api_service.dart';
import '../models/chat_message_model.dart';

class ChatbotService {
  final ApiService _apiService = ApiService(dio: Dio());

  Future<Map<String, dynamic>> sendMessage(String message) async {
    try {
      //AppLogs.debugLog('Sending message: $message');
      final response = await _apiService.postWithoutToken(
        endPoint: '/recommend',
        body: {'message': message},
      );

      // Check if response is a string (error message)
      if (response.data is String) {
        throw response.data;
      }

      // Check if response has the expected structure
      if (response.data == null || response.data['response'] == null) {
        throw 'Invalid response format from server';
      }

      return response.data;
    } catch (e) {
      //AppLogs.errorLog('Error sending message: $e');
      rethrow;
    }
  }

  Future<ChatMessage> getRecommendations(String message) async {
    try {
      final jsonResponse = await sendMessage(message);

      // Validate response structure
      if (jsonResponse['response'] == null ||
          jsonResponse['response']['bot'] == null) {
        throw 'Invalid response format from server';
      }

      final botMessage = jsonResponse['response']['bot'] as String;

      List<MovieRecommendation> recommendations = [];
      if (jsonResponse['response']['recommendations'] != null) {
        try {
          recommendations =
              (jsonResponse['response']['recommendations'] as List)
                  .map((recommendation) =>
                      MovieRecommendation.fromJson(recommendation))
                  .toList();
        } catch (e) {
          //AppLogs.errorLog('Error parsing recommendations: $e');
          // Continue without recommendations if parsing fails
        }
      }

      return ChatMessage(
        message: botMessage,
        type: MessageType.bot,
        recommendations: recommendations,
      );
    } catch (e) {
      //AppLogs.errorLog('Error getting recommendations: $e');
      final errorMessage = e is String
          ? e
          : 'Sorry, I encountered an error. Please try again later.';
      return ChatMessage(
        message: errorMessage,
        type: MessageType.bot,
      );
    }
  }
}
