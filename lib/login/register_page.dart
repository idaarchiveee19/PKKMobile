import 'package:flutter/material.dart';
import 'pilih_wilayah_page.dart';

class RegisterPage extends StatefulWidget {
  final String role;

  const RegisterPage({super.key, required this.role});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isObscure1 = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEEE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 50),

              // 🔥 HEADER (DINAMIS)
              Center(
                child: Text(
                  widget.role == "desa"
                      ? "Pendaftaran Pengguna Desa"
                      : "Pendaftaran Pengguna Kecamatan",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 DESKRIPSI (DINAMIS)
              Center(
                child: Text(
                  widget.role == "desa"
                      ? "Silakan daftar sebagai pengguna Desa dengan mengisi data yang diperlukan."
                      : "Silakan daftar sebagai pengguna Kecamatan dengan mengisi data yang diperlukan.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    height: 1.6,
                    color: Color(0xFF6E6E6E),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔥 NAMA
              const Text("Nama", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),

              TextField(
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Nama lengkap",
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 WA
              const Text("Nomor WhatsApp", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),

              TextField(
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "0821xxxxxxx",
                  prefixIcon: const Icon(Icons.phone),
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 PASSWORD
              const Text("Password", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),

              TextField(
                obscureText: isObscure1,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "********",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(isObscure1
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() => isObscure1 = !isObscure1);
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 CONFIRM PASSWORD
              const Text("Confirm Password", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 10),

              TextField(
                obscureText: isObscure2,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "********",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(isObscure2
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() => isObscure2 = !isObscure2);
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFFEAEAEA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),


              const SizedBox(height: 30),

              // 🔥 BUTTON
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PilihWilayahPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F8FB5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 BACK TO LOGIN
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text.rich(
                    TextSpan(
                      text: "Sudah punya akun? ",
                      style: TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                          text: "Masuk",
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