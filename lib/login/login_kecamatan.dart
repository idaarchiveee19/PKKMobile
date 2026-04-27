import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'lupa_password.dart';
import 'register_page.dart';
import '../main_page.dart';

class LoginKecamatanPage extends StatefulWidget {
  const LoginKecamatanPage({super.key});

  @override
  State<LoginKecamatanPage> createState() => _LoginKecamatanPageState();
}

class _LoginKecamatanPageState extends State<LoginKecamatanPage> {
  bool isObscure = true;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 🔥 FUNCTION LOGIN
  void handleLogin() {
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    if (phone.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nomor WhatsApp dan Password wajib diisi"),
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

    // 🔥 PINDAH KE BERANDA
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const MainPage(),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login berhasil"),
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
                      "Masuk Sebagai Kecamatan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
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
                  "Masuk sebagai Kecamatan merupakan pengguna Anggota PKK dari Kecamatan.\nSilahkan masuk menggunakan akun yang sudah terdaftar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    height: 1.7,
                    color: Color(0xFF6E6E6E),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 🔥 LABEL WA
              const Text(
                "Nomor WhatsApp",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              // 🔥 INPUT WA
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

              const SizedBox(height: 30),

              // 🔥 LABEL PASSWORD
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              // 🔥 INPUT PASSWORD
              TextField(
                controller: passwordController,
                obscureText: isObscure,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "********",
                  hintStyle: const TextStyle(fontSize: 20),
                  prefixIcon: const Icon(Icons.lock, size: 24),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 22),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 🔥 LUPA PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LupaPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Lupa Password?",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 🔥 BUTTON LOGIN
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F8FB5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 🔥 DAFTAR
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterPage(role: "kecamatan"),
                      ),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Belum punya akun? ",
                      style: TextStyle(fontSize: 20),
                      children: [
                        TextSpan(
                          text: "Daftar",
                          style: TextStyle(
                            color: Color(0xFF4F8FB5),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
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