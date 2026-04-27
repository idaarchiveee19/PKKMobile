import 'package:flutter/material.dart';
import 'login_desa_page.dart';
import 'login_kecamatan.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEEE),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [

                      const SizedBox(height: 40),

                      // 🔥 JUDUL
                      const Text(
                        "Selamat Datang di Aplikasi PKK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4A4A4A),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // 🔥 ILUSTRASI (RESPONSIVE)
                      Image.asset(
                        'assets/images/logo_selamat_datang.png',
                        height: constraints.maxHeight * 0.3, // 🔥 fleksibel
                      ),

                      const SizedBox(height: 25),

                      // 🔥 DESKRIPSI
                      const Text(
                        "Silahkan pilih button masuk sebagai pengguna desa atau kecamatan untuk melanjutkan ke proses selanjutnya",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          height: 1.7,
                          color: Color(0xFF6E6E6E),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // 🔥 BUTTON DESA
                      SizedBox(
                        width: double.infinity,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginDesaPage(),
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
                            "Masuk sebagai desa",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // 🔥 BUTTON KECAMATAN
                      SizedBox(
                        width: double.infinity,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const LoginKecamatanPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE0E0E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          child: const Text(
                            "Masuk sebagai kecamatan",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Color(0xFF8A8A8A),
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
          },
        ),
      ),
    );
  }
}