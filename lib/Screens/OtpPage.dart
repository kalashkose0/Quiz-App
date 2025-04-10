import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/home.dart';

class OtpPage extends StatelessWidget {
  final String phoneNumber;
  final TextEditingController _otpController = TextEditingController();

  OtpPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedf3f6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            height: 200,
            padding: const EdgeInsets.only(left: 20, top: 60),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 61, 60, 60),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.sms, color: Colors.white, size: 40),
                const SizedBox(width: 15),
                Text(
                  "OTP Verification",
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Enter the OTP sent to +91 $phoneNumber",
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: "OTP",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("OTP Verified")),
                  );
                },
                child: const Text("Verify", style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
