import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
// import 'package:stargazer/core/constants.dart';
import 'package:stargazer/core/constants/api_constants.dart';

// class PredictionResult {
//   final String annotatedImage; // Base64 encoded annotated image
//   final List<double> predictions; // List of predictions with keypoints

//   PredictionResult({
//     required this.annotatedImage,
//     required this.predictions,
//   });

//   // Factory constructor to create PredictionResult from JSON
//   factory PredictionResult.fromJson(Map<String, dynamic> json) {
//     return PredictionResult(
//       annotatedImage: json['annotated_image'],
//       predictions: List<double>.from(json['predictions']),
//     );
//   }
// }
class PalmPrediction {
  final String lineType; // 'fate', 'head', 'heart', 'life'
  final String interpretation;
  final double confidence;
  final double length;
  final String shape; // 'straight' or 'curved'

  PalmPrediction({
    required this.lineType,
    required this.interpretation,
    required this.confidence,
    required this.length,
    required this.shape,
  });

  factory PalmPrediction.fromJson(Map<String, dynamic> json) {
    return PalmPrediction(
      lineType: json['line_type'],
      interpretation: json['interpretation'],
      confidence: (json['confidence'] as num).toDouble(),
      length: (json['length'] as num).toDouble(),
      shape: json['shape'],
    );
  }
}

class PredictionResult {
  final String annotatedImage; // Base64 encoded annotated image
  final List<double> predictions; // List of predictions with keypoints
  final List<PalmPrediction>
      palmPredictions; // List of palm reading predictions

  PredictionResult({
    required this.annotatedImage,
    required this.predictions,
    required this.palmPredictions,
  });

  // Factory constructor to create PredictionResult from JSON
  factory PredictionResult.fromJson(Map<String, dynamic> json) {
    return PredictionResult(
      annotatedImage: json['annotated_image'],
      predictions: List<double>.from(json['predictions']),
      palmPredictions: (json['palm_predictions'] as List)
          .map((prediction) => PalmPrediction.fromJson(prediction))
          .toList(),
    );
  }
}

class PredictingImageUsecase {
  Future<PredictionResult> call(XFile imageFile) async {
    try {
      // Validate image file
      final file = File(imageFile.path);
      if (!await file.exists()) {
        throw Exception('Image file does not exist');
      }

      // Create multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiConstants.ApiPalmline),
      );

      // Add image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
        ),
      );

      // Send request
      final response = await request.send();
      print('da goi toi api nhan dien');

      // Read response
      final responseBody = await response.stream.bytesToString();
      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(responseBody);
        return PredictionResult.fromJson(responseData);
      } else {
        throw Exception('Failed to process image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error processing image: $e');
      rethrow;
    }
  }
}
