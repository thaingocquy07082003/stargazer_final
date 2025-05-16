import 'package:flutter/material.dart';
// import 'package:stargazer/core/services/domain/entities/tarot.dart';
// import 'package:stargazer/features/tarrot_telling/data/tarot_repo_impl.dart';

class Card_Widget extends StatefulWidget {
  final String name;
  final String image;
  final void Function() onTap;
  const Card_Widget({super.key, required this.name, required this.image, required this.onTap});

  @override
  State<Card_Widget> createState() => _CardState();
}

class _CardState extends State<Card_Widget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: widget.onTap,
              child: Image.asset(
                widget.image,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
