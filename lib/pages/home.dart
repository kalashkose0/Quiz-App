import 'package:flutter/material.dart';
// import 'package:quiz_app/pages/AnimalPage/AnimalPage.dart';
import 'package:quiz_app/pages/AnimalPage/AnimalQuestion.dart';
// import 'package:quiz_app/pages/CategoryPage.dart';
import 'package:quiz_app/pages/FruitPage/FruitPage.dart';
import 'package:quiz_app/pages/ObjectPage/ObjectPage.dart';
import 'package:quiz_app/pages/PlacePage/PlacePage.dart';
import 'package:quiz_app/pages/RandomPage/RandomPage.dart';
// import 'package:quiz_app/pages/SportsPage/SportsPage.dart';
import 'package:quiz_app/pages/SportsPage/Sportsquestion.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> arrCategories = [
    {'img': "assets/images/tower.png", 'name': "Place"},
    //
    {'img': "assets/images/animal.png", 'name': "Animal"},
    //
    {'img': "assets/images/fruits.png", 'name': "Fruit"},
    //
    {'img': "assets/images/object.png", 'name': "Object"},
    //
    {'img': "assets/images/sports.png", 'name': "Sports"},
    //
    {'img': "assets/images/random.png", 'name': "Random"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedf3f6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 61, 60, 60),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "assets/images/21004063.jpg",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Kalash K",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: const EdgeInsets.only(top: 120, left: 20),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          "assets/images/question-mark.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Play &\nWin",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Play Quiz by\nguessing the image",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Top Quiz Categories",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: arrCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final category = arrCategories[index];
                  return GestureDetector(
                    onTap: () {
                      Widget? nextPage;

                      switch (category['name']) {
                        case "Place":
                          nextPage = PlacePage();
                          break;
                        case "Animal":
                          nextPage = Animalquestion();
                          break;
                        case "Fruit":
                          nextPage = FruitPage();
                          break;
                        case "Object":
                          nextPage = PlacePage();
                          break;
                        case "Sports":
                          nextPage = Sportsquestion();
                          break;
                        case "Random":
                          nextPage = RandomPage();
                          break;
                        default:
                          nextPage = null; // Handle unknown categories
                      }

                      if (nextPage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => nextPage!),
                        );
                      } else {
                        // Optional: Show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Page not found!")),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            category['img'],
                            height: 80,
                            width: 80,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category['name'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
