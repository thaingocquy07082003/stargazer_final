import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stargazer/features/setting/presentation/provider/setting_provider.dart';
class TarotHome extends StatefulWidget {
  const TarotHome({super.key});

  @override
  State<TarotHome> createState() => _TarotHomeState();
}

class _TarotHomeState extends State<TarotHome> {
  @override
  Widget build(BuildContext context) {
    int text = Provider.of<SettingProvider>(context).language;
    int theme = Provider.of<SettingProvider>(context).theme;
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 12, 38, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(25, 12, 38, 1),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text == 0 ? 'Tarot Cards Reading' : 'Những lá bài Tarot',
                style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold , color: theme == 0 ? Colors.black : Colors.white),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 20),
                width: MediaQuery.of(context).size.width * 0.95, // Chiều rộng cố định
                alignment: Alignment.center, // Căn giữa nội dung
                child: Text(
                  text == 0
                      ? 'Find out what your future holds with a psychic reading.'
                      : 'Tìm hiểu tương lai của bạn sẽ như thế nào với bài đọc tâm linh',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme == 0 ? Colors.black : Colors.white60,
                  ),
                  maxLines: 3, // Giới hạn tối đa 3 dòng
                  overflow: TextOverflow.ellipsis, // Thêm dấu ... nếu văn bản vượt quá 3 dòng
                  textAlign: TextAlign.center, // Căn giữa văn bản
                ),
              ),
              Image.asset(
                'lib/assets/images/tarot_home.png', // Đường dẫn file SVG
                width: MediaQuery.of(context).size.width * 0.9, // Kích thước tùy chỉnh
                height: MediaQuery.of(context).size.width * 1.13,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tarotDisplay');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.purple, 
                    foregroundColor: Colors.white, 
                  ),
                  child: Text('Start Reading' , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}