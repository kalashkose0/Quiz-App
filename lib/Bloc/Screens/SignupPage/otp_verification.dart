import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/Bloc/auth/auth_bloc.dart';
import 'package:quiz_app/Bloc/auth/auth_event.dart';
import 'package:quiz_app/Bloc/auth/auth_state.dart';


class OtpVerificationPage extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;
  final TextEditingController _otpController = TextEditingController();

  OtpVerificationPage(
      {super.key, required this.phoneNumber, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedf3f6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
        child: Column(
          children: [
            Text("OTP sent to +91 $phoneNumber", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is AuthLoadedState) {
                  Navigator.pushReplacementNamed(context, "/home");
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          VerifyOtpEvent(
                            _otpController.text.trim(),
                            verificationId,
                          ),
                        );
                  },
                  child: state is AuthLoadingState
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Verify OTP"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
