import 'package:flutter/material.dart';
import 'package:stargazer/core/core.dart'; // Assuming AppColors is here

class ZodiacSign {
  final String name;
  final String dateRange;
  final String imageUrl; // Placeholder for image path

  ZodiacSign({
    required this.name,
    required this.dateRange,
    required this.imageUrl,
  });
}

final List<ZodiacSign> zodiacSigns = [
  ZodiacSign(
      name: 'ARIES',
      dateRange: 'Mar 21 - Apr 19',
      imageUrl: 'assets/zodiac_aries.png'),
  ZodiacSign(
      name: 'TAURUS',
      dateRange: 'Apr 20 - May 20',
      imageUrl: 'assets/zodiac_taurus.png'),
  ZodiacSign(
      name: 'GEMINI',
      dateRange: 'May 21 - Jun 20',
      imageUrl: 'assets/zodiac_gemini.png'),
  ZodiacSign(
      name: 'CANCER',
      dateRange: 'Jun 21 - Jul 22',
      imageUrl: 'assets/zodiac_cancer.png'),
  ZodiacSign(
      name: 'LEO',
      dateRange: 'Jul 23 - Aug 22',
      imageUrl: 'assets/zodiac_leo.png'),
  ZodiacSign(
      name: 'VIRGO',
      dateRange: 'Aug 23 - Sep 22',
      imageUrl: 'assets/zodiac_virgo.png'),
  ZodiacSign(
      name: 'LIBRA',
      dateRange: 'Sep 23 - Oct 22',
      imageUrl: 'assets/zodiac_libra.png'),
  ZodiacSign(
      name: 'SCORPIO',
      dateRange: 'Oct 23 - Nov 21',
      imageUrl: 'assets/zodiac_scorpio.png'),
  ZodiacSign(
      name: 'SAGITTARIUS',
      dateRange: 'Nov 22 - Dec 21',
      imageUrl: 'assets/zodiac_sagittarius.png'),
  ZodiacSign(
      name: 'CAPRICORN',
      dateRange: 'Dec 22 - Jan 19',
      imageUrl: 'assets/zodiac_capricorn.png'),
  ZodiacSign(
      name: 'AQUARIUS',
      dateRange: 'Jan 20 - Feb 18',
      imageUrl: 'assets/zodiac_aquarius.png'),
  ZodiacSign(
      name: 'PISCES',
      dateRange: 'Feb 19 - Mar 20',
      imageUrl: 'assets/zodiac_pisces.png'),
];

class CompatibilityScreen extends StatefulWidget {
  const CompatibilityScreen({super.key});

  @override
  State<CompatibilityScreen> createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen> {
  int _selectedIndex1 = 0;
  int _selectedIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Extended Compatibility',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Select two signs you want to check',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildZodiacSelector(0),
                const Icon(Icons.add, color: Colors.white, size: 40),
                _buildZodiacSelector(1),
              ],
            ),
          ),
          _buildCheckCompatibilityButton(),
        ],
      ),
    );
  }

  Widget _buildZodiacSelector(int selectorIndex) {
    return SizedBox(
      width: 150,
      height: 200,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 150, // Height of each item
        perspective: 0.002, // Adds a slight perspective effect
        diameterRatio: 1.5, // Controls the curvature
        onSelectedItemChanged: (index) {
          setState(() {
            if (selectorIndex == 0) {
              _selectedIndex1 = index;
            } else {
              _selectedIndex2 = index;
            }
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final sign = zodiacSigns[index % zodiacSigns.length];
            bool isSelected =
                (selectorIndex == 0 && index == _selectedIndex1) ||
                    (selectorIndex == 1 && index == _selectedIndex2);

            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: isSelected ? 150 : 120,
              height: isSelected ? 150 : 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isSelected
                      ? [Colors.purple.shade300, Colors.purple.shade700]
                      : [Colors.grey.shade800, Colors.grey.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: isSelected
                    ? Border.all(color: Colors.blue.shade300, width: 3)
                    : null,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]
                    : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    sign.imageUrl,
                    width: isSelected ? 70 : 50,
                    height: isSelected ? 70 : 50,
                    color: Colors.white, // assuming images are white line art
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sign.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isSelected ? 18 : 14,
                    ),
                  ),
                  Text(
                    sign.dateRange,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: isSelected ? 12 : 10,
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: zodiacSigns.length * 1000, // Make it seem endless
        ),
      ),
    );
  }

  Widget _buildCheckCompatibilityButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade400, Colors.purple.shade700],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            // Handle check compatibility
            final sign1 = zodiacSigns[_selectedIndex1 % zodiacSigns.length];
            final sign2 = zodiacSigns[_selectedIndex2 % zodiacSigns.length];
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Checking compatibility for ${sign1.name} and ${sign2.name}'),
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            'Check Compatibility',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
