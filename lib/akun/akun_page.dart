import 'package:flutter/material.dart';
import 'profil_page.dart'; // 🔥 tambah ini

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3EEEE),

      child: SafeArea(
        child: Column(
          children: [

            // 🔥 HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Akun",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // 🔥 PROFILE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),

                  const SizedBox(width: 12),

                  const Text(
                    "Ahmad...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔥 MENU CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                children: [

                  // 🔥 FIX DI SINI
                  MenuItem(
                    icon: Icons.person,
                    title: "Profil Saya",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfilPage(),
                        ),
                      );
                    },
                  ),

                  const MenuItem(
                    icon: Icons.lock_reset,
                    title: "Ubah Kata Sandi",
                  ),

                  const MenuItem(
                    icon: Icons.info_outline,
                    title: "Tentang Kami",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 BUTTON KELUAR
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                child: const Text(
                  "Keluar",
                  style: TextStyle(
                    color: Color(0xFF4F8FB5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔥 MENU ITEM (FIX TAMBAH onTap)
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap; // 🔥 tambah ini

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap, // 🔥 tambah ini
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // 🔥 pakai ini
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [

            Icon(icon, color: Colors.black87),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),

            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}