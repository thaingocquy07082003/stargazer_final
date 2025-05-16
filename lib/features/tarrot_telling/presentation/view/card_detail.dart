import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stargazer/core/services/domain/entities/tarot.dart';
import 'package:stargazer/features/tarrot_telling/data/tarot_repo_impl.dart';
import 'package:stargazer/features/tarrot_telling/presentation/provider/tarot_provider.dart';

class CardDetail extends StatefulWidget {

  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    int index = Provider.of<TarotProvider>(context).chosenTarot;
    List<Tarot> tarotlist = TarotRepositoryImpl().getTarot();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back ,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(tarotlist[index].name,style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold , color: Colors.white),),
        backgroundColor: const Color.fromRGBO(25, 12, 38, 1),
      ),
      backgroundColor: const Color.fromRGBO(25, 12, 38, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Image.asset(tarotlist[index].image, width: 180 , height: 340), // Replace with your image
              const SizedBox(height: 20),
               Center(
                child: Container(
                  width: 300, // Fixed width for the container
                  padding: const EdgeInsets.all(16.0), // Padding inside the container
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple, // Purple border
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  ),
                  child: Text(
                    tarotlist[index].description,
                    textAlign: TextAlign.center, 
                    style: const TextStyle(fontSize: 16 , color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}