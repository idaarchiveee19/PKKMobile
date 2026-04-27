import 'package:flutter/material.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int selectedTab = 0;

  final List<String> tabs = ["Proses", "Revisi", "Selesai"];

  final Color primaryColor = const Color(0xFF4F8FB5);

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
                        "Riwayat",
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

            // 🔥 TAB
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final isActive = selectedTab == index;

                  Color bgColor;
                  Color textColor;

                  if (isActive) {
                    if (index == 0) {
                      bgColor = primaryColor;
                      textColor = Colors.white;
                    } else if (index == 1) {
                      bgColor = const Color.fromARGB(255, 216, 100, 100);
                      textColor = Colors.white;
                    } else {
                      bgColor = Colors.green;
                      textColor = Colors.white;
                    }
                  } else {
                    bgColor = const Color(0xFFE0E0E0);
                    textColor = Colors.black87;
                  }

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 12),

            // 🔥 LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: _buildList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 DATA DINAMIS SESUAI TAB
  List<Widget> _buildList() {
    if (selectedTab == 0) {
      return const [
        RiwayatCard(status: "proses"),
        RiwayatCard(status: "proses"),
      ];
    } else if (selectedTab == 1) {
      return const [
        RiwayatCard(status: "revisi"),
        RiwayatCard(status: "revisi"),
      ];
    } else {
      return const [
        RiwayatCard(status: "selesai"),
        RiwayatCard(status: "ditolak"),
      ];
    }
  }
}

// 🔥 CARD
class RiwayatCard extends StatelessWidget {
  final String status;

  const RiwayatCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {

    Color iconBg;
    Color iconColor;
    IconData icon;
    String label;
    Color labelColor;

    if (status == "proses") {
      iconBg = const Color(0xFFFFF3E0);
      iconColor = const Color(0xFFF59E0B);
      icon = Icons.access_time;
      label = "Proses";
      labelColor = const Color(0xFFF59E0B);
    } else if (status == "revisi") {
      iconBg = const Color(0xFFFDECEC); // 🔥 lebih soft
      iconColor = const Color.fromARGB(255, 159, 51, 49);
      icon = Icons.edit;
      label = "Revisi";
      labelColor = const Color.fromARGB(255, 159, 51, 49);
    } else if (status == "selesai") {
      iconBg = const Color(0xFFE8F5E9);
      iconColor = const Color(0xFF43A047);
      icon = Icons.check_circle;
      label = "Disetujui";
      labelColor = const Color(0xFF43A047);
    } else {
      iconBg = const Color(0xFFEEEEEE);
      iconColor = Colors.black54;
      icon = Icons.close;
      label = "Dibatalkan";
      labelColor = const Color.fromARGB(137, 118, 30, 30);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18), // 🔥 lebih bulat
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),

      child: Row(
        children: [

          // 🔥 ICON KIRI (BULAT)
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle, // 🔥 bulat full
            ),
            child: Icon(icon, color: iconColor),
          ),

          const SizedBox(width: 12),

          // 🔥 TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Bidang Kesehatan",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_calender.png', // 🔥 pakai gambar kamu
                      width: 16,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "06-05-2023",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🔥 BADGE (PILL / BULAT)
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(50), // 🔥 pill
            ),
            child: Row(
              children: [
                Icon(icon, size: 14, color: iconColor),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}