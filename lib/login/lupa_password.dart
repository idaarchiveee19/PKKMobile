import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LupaPasswordPage extends StatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  State<LupaPasswordPage> createState() => _LupaPasswordPageState();
}

class _LupaPasswordPageState extends State<LupaPasswordPage> {

  final TextEditingController phoneController = TextEditingController();

  void handleSubmit() {
    String phone = phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nomor WhatsApp wajib diisi"),
        ),
      );
      return;
    }

    if (phone.length < 10 || phone.length > 13) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nomor WhatsApp harus 10 - 13 digit"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Kode reset dikirim"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEEE),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 35),

              // 🔥 HEADER
              SizedBox(
                height: 70,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new, size: 24),
                      ),
                    ),
                    const Text(
                      "Atur Ulang Kata Sandi",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 DESKRIPSI
              const Center(
                child: Text(
                  "Mohon masukkan nomor whatsapp anda yang sudah didaftarkan diaplikasi ini.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    height: 1.7,
                    color: Color(0xFF6E6E6E),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔥 ILUSTRASI
              Center(
                child: Image.asset(
                  'assets/images/logo_atur_sandi.png',
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // 🔥 LABEL
              const Center(
                child: Text(
                  "Nomor WhatsApp",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 🔥 INPUT
              TextField(
                controller: phoneController,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(13),
                ],
                decoration: InputDecoration(
                  hintText: "0821xxxxxxx",
                  hintStyle: const TextStyle(fontSize: 20),
                  prefixIcon: const Icon(Icons.phone, size: 24),
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 22),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 🔥 BUTTON
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F8FB5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Text(
                    "Lanjut",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}