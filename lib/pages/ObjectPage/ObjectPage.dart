import 'package:flutter/material.dart';

class ObjectPage extends StatelessWidget {
  const ObjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 150, 132),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 20,
                  child: Icon(
                    Icons.chevron_left_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Text(
                  "Animal",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/tower1.png",
                            height: 240,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OptionBox(text: "Statue"),
                      SizedBox(
                        height: 20,
                      ),
                      OptionBox(text: "Burj Khalifa"),
                      SizedBox(
                        height: 20,
                      ),
                      OptionBox(text: "Tower"),
                      SizedBox(
                        height: 20,
                      ),
                      OptionBox(text: "Gate"),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add navigation or action here
                        },
                        child: Text("Next"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class OptionBox extends StatelessWidget {
  final String text;
  const OptionBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
