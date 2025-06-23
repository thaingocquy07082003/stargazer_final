import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stargazer/core/constants/api_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CompatibilityScreen(),
    );
  }
}

class CompatibilityScreen extends StatefulWidget {
  @override
  _CompatibilityScreenState createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen>
    with TickerProviderStateMixin {
  // Danh sách cung hoàng đạo
  final List<Map<String, dynamic>> zodiacSigns = [
    {
      "name": "Aries",
      "date": "Mar 21 - Apr 19",
      "image": "lib/assets/images/assets_images_anim_aries.png"
    },
    {
      "name": "Taurus",
      "date": "Apr 20 - May 20",
      "image": "lib/assets/images/assets_images_anim_taurus.png"
    },
    {
      "name": "Gemini",
      "date": "May 21 - Jun 20",
      "image": "lib/assets/images/assets_images_anim_gemini.png"
    },
    {
      "name": "Cancer",
      "date": "Jun 21 - Jul 22",
      "image": "lib/assets/images/assets_images_anim_cancer.png"
    },
    {
      "name": "Leo",
      "date": "Jul 23 - Aug 22",
      "image": "lib/assets/images/assets_images_anim_leo.png"
    },
    {
      "name": "Virgo",
      "date": "Aug 23 - Sep 22",
      "image": "lib/assets/images/assets_images_anim_virgo.png"
    },
    {
      "name": "Libra",
      "date": "Sep 23 - Oct 22",
      "image": "lib/assets/images/assets_images_anim_libra.png"
    },
    {
      "name": "Scorpio",
      "date": "Oct 23 - Nov 21",
      "image": "lib/assets/images/assets_images_anim_scorpio.png"
    },
    {
      "name": "Sagittarius",
      "date": "Nov 22 - Dec 21",
      "image": "lib/assets/images/assets_images_anim_sagittarius.png"
    },
    {
      "name": "Capricorn",
      "date": "Dec 22 - Jan 19",
      "image": "lib/assets/images/assets_images_anim_capricorn.png"
    },
    {
      "name": "Aquarius",
      "date": "Jan 20 - Feb 18",
      "image": "lib/assets/images/assets_images_anim_aquarius.png"
    },
    {
      "name": "Pisces",
      "date": "Feb 19 - Mar 20",
      "image": "lib/assets/images/assets_images_anim_pisces.png"
    },
  ];

  // Lưu hai cung hoàng đạo đã chọn
  String? selectedSign1;
  String? selectedSign2;

  // Controllers cho animation quay
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  // Thêm biến để lưu kết quả và trạng thái loading
  String? compatibilityResult;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation1 = Tween<double>(begin: 0, end: 2 * pi).animate(_controller1);
    _animation2 = Tween<double>(begin: 0, end: 2 * pi).animate(_controller2);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  // Hàm quay để chọn ngẫu nhiên cung hoàng đạo
  void _spinWheel(int position) {
    if (position == 1) {
      _controller1.reset();
      _animation1 = Tween<double>(
        begin: 0,
        end: 2 * pi * (Random().nextInt(5) + 1),
      ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeOut));

      _animation1.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final randomSign = zodiacSigns[Random().nextInt(zodiacSigns.length)];
          setState(() {
            if (selectedSign2 != randomSign['name']) {
              selectedSign1 = randomSign['name'];
            }
          });
        }
      });
      _controller1.forward();
    } else {
      _controller2.reset();
      _animation2 = Tween<double>(
        begin: 0,
        end: 2 * pi * (Random().nextInt(5) + 1),
      ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeOut));

      _animation2.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final randomSign = zodiacSigns[Random().nextInt(zodiacSigns.length)];
          setState(() {
            if (selectedSign1 != randomSign['name']) {
              selectedSign2 = randomSign['name'];
            }
          });
        }
      });
      _controller2.forward();
    }
  }

  // Hàm gửi request và nhận kết quả
  Future<void> _checkCompatibility() async {
    if (selectedSign1 == null || selectedSign2 == null) return;

    setState(() {
      isLoading = true;
      compatibilityResult = null;
    });
     await FirebaseAnalytics.instance.logEvent(
      name: 'compatibility_telling',
    );
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.ApiLLM),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'message':
              'Hãy cho tôi biết đồ phù hợp tình duyên giữ 2 người cung hoàng đạo $selectedSign1 và $selectedSign2'
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        setState(() {
          compatibilityResult = responseData['response'];
          isLoading = false;
        });
      } else {
        setState(() {
          compatibilityResult = 'Có lỗi xảy ra khi kiểm tra tương hợp';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        compatibilityResult = 'Không thể kết nối đến máy chủ';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A2E),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Extended Compatibility',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Spin to select two signs',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Hiển thị hai cung đã chọn với hiệu ứng quay
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _spinWheel(1),
                  child: AnimatedBuilder(
                    animation: _animation1,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation1.value,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: selectedSign1 == null
                              ? Colors.grey[800]
                              : Color(0xFF1A1A2E),
                          child: selectedSign1 == null
                              ? Image.asset(
                                  'lib/assets/images/assets_images_nring_11.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error,
                                        color: Colors.white, size: 40);
                                  },
                                )
                              : Image.asset(
                                  zodiacSigns.firstWhere((sign) =>
                                      sign['name'] == selectedSign1)['image'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(
                                      selectedSign1![0],
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '+',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.purple[300],
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () => _spinWheel(2),
                  child: AnimatedBuilder(
                    animation: _animation2,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation2.value,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: selectedSign2 == null
                              ? Colors.grey[800]
                              : Color(0xFF1A1A2E),
                          child: selectedSign2 == null
                              ? Image.asset(
                                  'lib/assets/images/assets_images_nring_11.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error,
                                        color: Colors.white, size: 40);
                                  },
                                )
                              : Image.asset(
                                  zodiacSigns.firstWhere((sign) =>
                                      sign['name'] == selectedSign2)['image'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(
                                      selectedSign2![0],
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // Nút Check Compatibility
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: selectedSign1 != null && selectedSign2 != null
                    ? _checkCompatibility
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[300],
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Check Compatibility',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
              ),
            ),

            // Hiển thị kết quả
            if (compatibilityResult != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kết quả tương hợp:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        compatibilityResult!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
