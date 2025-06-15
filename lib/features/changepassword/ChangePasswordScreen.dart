import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stargazer/core/constants/api_constants.dart';
import 'package:stargazer/core/providers.dart';
import 'package:stargazer/core/utils/colors.dart';
import 'package:stargazer/core/utils/widgets/app_flush_bar.dart';
import 'package:stargazer/features/setting/presentation/provider/setting_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
        leading: IconButton(
          color: theme == 1 ? Colors.white : Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          text == 0 ? 'Set Password' : 'Đổi mật khẩu',
          style: TextStyle(color: theme == 1 ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        backgroundColor: theme == 1 ? AppColors.coal(1.0) : AppColors.rice(0.3),
      ),
      backgroundColor: theme == 1 ? AppColors.coal(1.0) : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text == 0
                      ? 'You can set a password for your account to login with email.'
                      : 'Bạn có thể thay đổi mật khẩu cho tài khoản của mình để đăng nhập vào lần tới.',
                  style: TextStyle(
                      fontSize: 16,
                      color: theme == 1 ? Colors.white : Colors.black),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _currentController,
                  obscureText: !_isCurrentPasswordVisible,
                  decoration: InputDecoration(
                    labelText:
                        text == 0 ? 'Current password' : 'Mật khẩu hiện tại',
                    labelStyle: TextStyle(
                        color: theme == 1 ? Colors.white : Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isCurrentPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: theme == 1 ? Colors.white : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isCurrentPasswordVisible =
                              !_isCurrentPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return text == 0
                          ? 'Please enter your current password'
                          : 'Nhập mật khẩu hiện tại';
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: theme == 1 ? Colors.white : Colors.black),
                ),
                const SizedBox(height: 20),
                // New Password field
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: !_isNewPasswordVisible,
                  decoration: InputDecoration(
                    labelText: text == 0 ? 'New password' : 'Mật khẩu mới',
                    labelStyle: TextStyle(
                        color: theme == 1 ? Colors.white : Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isNewPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: theme == 1 ? Colors.white : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return text == 0
                          ? 'Please enter your new password'
                          : 'Nhập mật khẩu mới';
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: theme == 1 ? Colors.white : Colors.black),
                ),
                const SizedBox(height: 15),
                // Confirm New Password field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: text == 0
                        ? 'Confirm new password'
                        : 'Xác nhận mật khẩu',
                    labelStyle: TextStyle(
                        color: theme == 1 ? Colors.white : Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: theme == 1 ? Colors.white : Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: theme == 1 ? Colors.white : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return text == 0
                          ? 'Please confirm your new password'
                          : 'Xác nhận mật khẩu mới';
                    }
                    if (value != _newPasswordController.text) {
                      return text == 0
                          ? 'Passwords do not match'
                          : 'Mật khẩu xác nhận không khớp';
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: theme == 1 ? Colors.white : Colors.black),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _setNewPassword(user!.token);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme == 1
                          ? Colors.white
                          : Colors.black, // Background color
                      foregroundColor: Colors.white, // Text color
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      text == 0 ? 'Set Password' : 'Đặt mật khẩu',
                      style: TextStyle(
                          fontSize: 18,
                          color: theme == 1 ? Colors.black : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setNewPassword(String token) async {
    if (_formKey.currentState!.validate()) {
      final String apiUrl =
          ApiConstants.changepasswordUrl; // Replace with your API URL

      final Map<String, String> requestBody = {
        'currentPassword': _currentController.text,
        'newPassword': _newPasswordController.text,
      };

      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(requestBody),
        );

        if (response.statusCode == 200) {
          // Password updated successfully
          CommonFlushBar.show(context, 'Password updated successfully',
              EFlushbarStatus.Success);
          // Reset the text controllers and password visibility states
          _currentController.clear();
          _newPasswordController.clear();
          _confirmPasswordController.clear();
          setState(() {
            _isCurrentPasswordVisible = false;
            _isNewPasswordVisible = false;
            _isConfirmPasswordVisible = false;
          });
        } else {
          // Handle errors
          CommonFlushBar.show(context, 'Current Password is incorrect',
              EFlushbarStatus.Success);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
    }
  }
}
