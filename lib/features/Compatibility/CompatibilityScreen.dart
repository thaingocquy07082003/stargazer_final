import 'package:flutter/material.dart';
import 'dart:math';

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
    with SingleTickerProviderStateMixin {
  // Danh sách cung hoàng đạo
  final List<Map<String, dynamic>> zodiacSigns = [
    {"name": "Aries", "date": "Mar 21 - Apr 19", "icon": Icons.star},
    {"name": "Taurus", "date": "Apr 20 - May 20", "icon": Icons.brightness_5},
    {"name": "Gemini", "date": "May 21 - Jun 20", "icon": Icons.face},
    {"name": "Cancer", "date": "Jun 21 - Jul 22", "icon": Icons.local_florist},
    {"name": "Leo", "date": "Jul 23 - Aug 22", "icon": Icons.local_fire_department},
    {"name": "Virgo", "date": "Aug 23 - Sep 22", "icon": Icons.local_hospital},
  ];

  // Lưu hai cung hoàng đạo đã chọn
  String? selectedSign1;
  String? selectedSign2;

  // Controller cho animation quay
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Thời gian quay 1s
    );
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Hàm quay để chọn ngẫu nhiên cung hoàng đạo
  void _spinWheel(int position) {
    _controller.reset();
    _animation = Tween<double>(
      begin: 0,
      end: 2 * pi * (Random().nextInt(5) + 1), // Quay ngẫu nhiên vài vòng
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          final randomSign = zodiacSigns[Random().nextInt(zodiacSigns.length)];
          setState(() {
            if (position == 1 && selectedSign2 != randomSign['name']) {
              selectedSign1 = randomSign['name'];
            } else if (position == 2 && selectedSign1 != randomSign['name']) {
              selectedSign2 = randomSign['name'];
            }
          });
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A2E),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.battery_full, color: Colors.white),
          ),
        ],
      ),
      body: Column(
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
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: selectedSign1 == null
                            ? Colors.grey[800]
                            : Colors.purple[200],
                        child: selectedSign1 == null
                            ? Icon(Icons.autorenew, size: 40, color: Colors.white)
                            : Text(
                                selectedSign1![0],
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
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
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: selectedSign2 == null
                            ? Colors.grey[800]
                            : Colors.purple[200],
                        child: selectedSign2 == null
                            ? Icon(Icons.autorenew, size: 40, color: Colors.white)
                            : Text(
                                selectedSign2![0],
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
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
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Compatibility Check'),
                          content: Text(
                            'Checking compatibility between $selectedSign1 and $selectedSign2...',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[300],
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Check Compatibility',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}