import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf3f6),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  padding: EdgeInsets.only(left: 20, top: 50),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 60, 60),
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
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Kalash K",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.only(top: 120, left: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset("assets/images/21004063.jpg"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Play &\nWin",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Play Quiz by\nguessing the image",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Top Quiz Categories",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [Image.asset("assets/images/21004063.jpg")],
            )
          ],
        ),
      ),
    );
  }
}
