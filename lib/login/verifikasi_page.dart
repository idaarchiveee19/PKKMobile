import 'package:flutter/material.dart';

class VerifikasiPage extends StatefulWidget {
  final String otp;

  const VerifikasiPage({super.key, required this.otp});

  @override
  State<VerifikasiPage> createState() => _VerifikasiPageState();
}

class _VerifikasiPageState extends State<VerifikasiPage> {
  final TextEditingController otpController = TextEditingController();

  void verifyOTP() {
    if (otpController.text == widget.otp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP benar")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP salah")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(controller: otpController),
            ElevatedButton(
              onPressed: verifyOTP,
              child: const Text("Konfirmasi"),
            )
          ],
        ),
      ),
    );
  }
}