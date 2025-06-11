import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stargazer/core/constants/api_constants.dart';

class GeminiService {
  final String _apiUrl = ApiConstants.ApiLLM; // Replace with your actual API URL

  Future<String> getResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },

        body: jsonEncode({
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] ?? 'Không nhận được phản hồi từ hệ thống';
      } else {
        throw Exception('Lỗi kết nối: ${response.statusCode}');
      }
    } catch (e) {
      print('Lỗi khi gọi API: $e');
      rethrow;
    }
  }
}
