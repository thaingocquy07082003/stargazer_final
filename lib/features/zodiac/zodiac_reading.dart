import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stargazer/core/services/domain/entities/zodiac.dart';
import 'package:stargazer/features/zodiac/zodiac_data.dart';
import 'package:stargazer/features/zodiac/zodiac_provider.dart';

class ZodiacReading extends StatefulWidget {
  const ZodiacReading({super.key});

  @override
  State<ZodiacReading> createState() => _ZodiacSelectorState();
}

class _ZodiacSelectorState extends State<ZodiacReading> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final provider = Provider.of<ZodiacProvider>(context, listen: false);
    final currentScroll = _scrollController.offset;
    const itemWidth = 120.0; // Tổng chiều rộng mỗi mục (100 + margin)
    int newIndex = (currentScroll / itemWidth).round().clamp(0, zodiacSigns.length - 1);

    if (newIndex != provider.selectedZodiacIndex) {
      provider.setSelectedZodiac(newIndex);
      // Tự động căn giữa mục được chọn
      _scrollController.animateTo(
        newIndex * itemWidth,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ZodiacProvider(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(17, 0, 34, 1.0),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Cung Hoàng Đạo',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(17, 0, 34, 1.0),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Thanh tùy chọn ngang cho các cung hoàng đạo
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: zodiacSigns.length,
                    itemBuilder: (context, index) {
                      return Consumer<ZodiacProvider>(
                        builder: (context, provider, child) {
                          bool isSelected = provider.selectedZodiacIndex == index;
                          return GestureDetector(
                            onTap: () {
                              provider.setSelectedZodiac(index);
                              // _scrollController.animateTo(
                              //   index * 120.0,
                              //   duration: const Duration(milliseconds: 300),
                              //   curve: Curves.easeInOut,
                              // );
                            },
                            child: Container(
                              width: 100,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected ? Colors.purpleAccent : Colors.transparent,
                                  width: isSelected ? 4 : 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: Color.fromRGBO(17, 0, 34, 1.0).withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    zodiacSigns[index].imagePath,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.contain,
                                    // color: isSelected ? null : Colors.grey,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    zodiacSigns[index].name,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.grey,
                                      fontSize: 14,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Nội dung động dựa trên cung hoàng đạo được chọn
                Consumer<ZodiacProvider>(
                  builder: (context, provider, child) {
                    Zodiac selectedZodiac = zodiacSigns[provider.selectedZodiacIndex];
                    return Column(
                      children: [
                        Image.asset(
                          selectedZodiac.imagePath,
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 300,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            selectedZodiac.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}