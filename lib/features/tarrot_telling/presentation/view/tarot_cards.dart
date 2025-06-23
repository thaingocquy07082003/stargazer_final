import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stargazer/core/services/domain/entities/tarot.dart';
import 'package:stargazer/features/tarrot_telling/data/tarot_repo_impl.dart';
import 'package:stargazer/features/tarrot_telling/presentation/provider/tarot_provider.dart';
import 'package:stargazer/features/tarrot_telling/presentation/view/widget/card.dart';

class TarotCards extends StatefulWidget {
  const TarotCards({super.key});

  @override
  State<TarotCards> createState() => _TarotCardsState();
}

class _TarotCardsState extends State<TarotCards> {
  @override
  Widget build(BuildContext context) {
    List<Tarot> tarotlist = TarotRepositoryImpl().getTarot();
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 12, 38, 1),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Tarot',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(25, 12, 38, 1),
      ),
      body: Center(
        child: GridView.builder(
          padding: EdgeInsets.all(5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số cột
            crossAxisSpacing: 5, // Khoảng cách ngang
            mainAxisSpacing: 2, // Khoảng cách dọc
            childAspectRatio: 0.6, // Tỷ lệ chiều rộng/chiều cao
          ),
          itemCount: tarotlist.length, // Số mục
          itemBuilder: (context, index) {
            return Card_Widget(
              name: tarotlist[index].name,
              image: tarotlist[index].image,
              onTap: () async {
                // Navigator.pushNamed(context, '/tarot_detail', arguments: tarotlist[index]);
                await FirebaseAnalytics.instance.logEvent(
                  name: 'Tarot_telling',
                  parameters: {
                    "tarot": tarotlist[index].name
                  }
                );
                Provider.of<TarotProvider>(context,listen: false).changeTarot(index);
                Navigator.pushNamed(context, '/tarotDetail');
              },
            );
          },
        ),
      ),
    );
  }
}
