import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz_app/Quizss/AnimalPage/AnimalQuestion.dart';
import 'package:quiz_app/Quizss/FruitPage/FruitPage.dart';
import 'package:quiz_app/Quizss/ObjectPage/ObjectPage.dart';
import 'package:quiz_app/Quizss/PlacePage/PlacePage.dart';
import 'package:quiz_app/Quizss/SportsPage/Sportsquestion.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of possible quiz pages
    final List<Widget> quizPages = [
      const Animalquestion(),
      const FruitPage(),
      const ObjectPage(),
      const PlacePage(),
      const Sportsquestion(),
    ];

    // Select a random index
    final randomIndex = Random().nextInt(quizPages.length);

    // Push the selected page
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => quizPages[randomIndex]),
      );
    });

    // Show a loading screen briefly
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(color: Colors.orange),
      ),
    );
  }
}
