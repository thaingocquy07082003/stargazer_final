import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stargazer/core/constants/api_constants.dart';
import 'package:stargazer/core/providers.dart';
import 'package:stargazer/core/utils/colors.dart';
import 'package:stargazer/core/utils/widgets/app_flush_bar.dart';
import 'package:stargazer/features/setting/presentation/provider/setting_provider.dart';
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert'; // Import for JSON encoding

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _suggestionController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _suggestionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic text =
        Provider.of<SettingProvider>(context, listen: false).language;
    dynamic theme = Provider.of<SettingProvider>(context).theme;
    var user = context.read<UserProvider>().getUser();
    return Scaffold(
      appBar: AppBar(
        title: Text(text == 0 ? 'Send feedback' : 'Gửi ý kiến'),
        centerTitle: true,
        // backgroundColor: theme == 1 ? AppColors.coal(1.0) : AppColors.rice(0.3)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: user!.email,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: _suggestionController,
                maxLines: null, // Allows for multiple lines
                expands: true, // Allows the text field to expand
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: text == 0
                      ? 'Please tell us your suggestion...'
                      : 'Hãy gửi thông điệp của bạn...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle sending feedback
                  // print('Email: ${_emailController.text}');
                  // print('Suggestion: ${_suggestionController.text}');

                  _sendFeedback(user.token); // Pass the user token

                  // You can add logic here to send the feedback,
                  // e.g., to a backend service or an email client.
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor:
                      Colors.grey[300], // Match the grey button color
                  foregroundColor: Colors.black54, // Match the text color
                ),
                child: Text(text == 0 ? 'Send' : 'Gửi'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendFeedback(String? token) async {
    final String apiUrl =
        ApiConstants.addReview; // Replace with your API endpoint

    if (token == null) {
      CommonFlushBar.show(context, 'Access token is empty',
              EFlushbarStatus.Failure);
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'context': _suggestionController.text,
        }),
      );

      if (response.statusCode == 200) {
        CommonFlushBar.show(context, 'Add Feedback successfully',
              EFlushbarStatus.Success);
      } else {
        CommonFlushBar.show(context, 'Failed to add feedback',
              EFlushbarStatus.Failure);
      }
    } catch (e) {
      print('Error sending feedback: $e');
      // Optionally, show an error message to the user
    }
  }
}
