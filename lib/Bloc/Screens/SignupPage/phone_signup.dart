import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/Bloc/auth/auth_bloc.dart';
import 'package:quiz_app/Bloc/auth/auth_event.dart';
import 'package:quiz_app/Bloc/auth/auth_state.dart';

import 'otp_verification.dart';

class PhoneSignupPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  PhoneSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedf3f6),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OtpSentState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OtpVerificationPage(
                  verificationId: state.verificationId,
                  phoneNumber: _phoneController.text,
                ),
              ),
            );
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthLoadedState) {
            // Go to home screen
            Navigator.pushReplacementNamed(context, "/home");
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
            child: Column(
              children: [
                const Text("Enter Phone Number",
                    style: TextStyle(fontSize: 22)),
                const SizedBox(height: 20),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    final phone = _phoneController.text.trim();
                    if (phone.length == 10) {
                      context.read<AuthBloc>().add(SendOtpEvent(phone));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid phone number")),
                      );
                    }
                  },
                  child: state is AuthLoadingState
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Send OTP"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
