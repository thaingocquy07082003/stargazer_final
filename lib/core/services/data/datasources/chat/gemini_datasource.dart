import 'gemini_service.dart';
class GeminiDatasource {
  final _service = GeminiService();

  Future<String> sendMessage(String message) async {
    try {
      final response = await _service.getResponse(message);
      if (response.isEmpty) {
        throw Exception('Phản hồi trống');
      }
      return response;
    } catch (e) {
      print('Lỗi trong GeminiDatasource: $e');
      throw Exception('Không thể kết nối với Chatbot: ${e.toString()}');
    }
  }
}
