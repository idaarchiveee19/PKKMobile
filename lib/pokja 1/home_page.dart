import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Selamat pagi";
    } else if (hour >= 12 && hour < 15) {
      return "Selamat siang";
    } else if (hour >= 15 && hour < 18) {
      return "Selamat sore";
    } else {
      return "Selamat malam";
    }
  }

  String getCurrentDate() {
    final now = DateTime.now();

    List<String> hari = [
      "Senin","Selasa","Rabu","Kamis","Jumat","Sabtu","Minggu"
    ];

    List<String> bulan = [
      "Januari","Februari","Maret","April","Mei","Juni",
      "Juli","Agustus","September","Oktober","November","Desember"
    ];

    return "${hari[now.weekday - 1]}, ${now.day} ${bulan[now.month - 1]} ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEEE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15),

              // 🔥 HEADER
              Row(
                children: [
                  Image.asset('assets/images/logo_pkk.png', width: 45),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${getGreeting()}, Ahmad",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          getCurrentDate(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),

              const SizedBox(height: 20),

              // 🔥 BANNER
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/banner_pkk.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.20,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 10),

              // 🔥 DOT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 8, color: Color(0xFF4F8FB5)),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 8, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 8, color: Colors.grey),
                ],
              ),

              const SizedBox(height: 20),

              // 🔥 LAYANAN
              Text(
                "Layanan PKK",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 15),

              buildMenuCard(
                icon: 'assets/images/icon_laporan.png',
                title: "Kirim Laporan",
                subtitle: "Laporkan kegiatan PKK bulanan",
              ),

              const SizedBox(height: 12),

              buildMenuCard(
                icon: 'assets/images/icon_foto.png',
                title: "Tambah Foto Kegiatan",
                subtitle: "Bagikan dokumentasi kegiatan",
                color: const Color(0xFFD7E8EC),
              ),

              const SizedBox(height: 20),

              // 🔥 PENGUMUMAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pengumuman",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: Color(0xFF4F8FB5),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              buildNewsCard(
                title: "Kegiatan PKK Desa Bagor",
                subtitle: "Senam bersama & kerja bakti",
                date: "17-04-2026",
              ),

              const SizedBox(height: 12),

              buildNewsCard(
                title: "Kegiatan PKK Desa Berbek",
                subtitle: "Makan bersama & gotong royong",
                date: "20-04-2026",
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 🔥 MENU CARD
  Widget buildMenuCard({
    required String icon,
    required String title,
    required String subtitle,
    Color color = const Color(0xFFE4EFF6),
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  // 🔥 NEWS CARD
  Widget buildNewsCard({
    String? image,
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image != null && image.isNotEmpty
                ? Image.asset(image, width: 70, height: 70, fit: BoxFit.cover)
                : Container(
                    width: 70,
                    height: 70,
                    color: const Color(0xFFE6F4FA),
                    child: const Icon(Icons.image, color: Color(0xFF4F8FB5)),
                  ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset('assets/images/icon_calender.png', width: 18),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4F8FB5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}