import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pokja 1/home_page.dart';
import 'riwayat/riwayat_page.dart';
import 'akun/akun_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> pages = [
    const HomePage(),
    const RiwayatPage(),
    const Center(child: Text("Pengumuman")),
    const AkunPage(),
  ];

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.history_rounded,
    Icons.notifications_rounded,
    Icons.person_rounded,
  ];

  final List<String> labels = [
    "Beranda",
    "Riwayat",
    "Pengumuman",
    "Akun",
  ];

  int notifCount = 3;

  final Color primaryColor = const Color(0xFF4F8FB5);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    // 🔥 AUTO SCALE
    final iconSize = screenWidth < 360 ? 22.0 : 26.0;
    final fontSize = screenWidth < 360 ? 9.0 : 11.0;
    final paddingVertical = screenWidth < 360 ? 4.0 : 6.0;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: paddingVertical),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFFE5E5E5)),
            ),
          ),
          child: Row(
            children: List.generate(icons.length, (index) {
              final isActive = currentIndex == index;

              return Expanded(
                child: InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();

                    setState(() {
                      currentIndex = index;
                    });

                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  splashColor: primaryColor.withOpacity(0.2),
                  highlightColor: primaryColor.withOpacity(0.1),

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth < 360 ? 4 : 8,
                      vertical: 4,
                    ),
                    padding: EdgeInsets.symmetric(vertical: paddingVertical),
                    decoration: BoxDecoration(
                      color: isActive
                          ? primaryColor.withOpacity(0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // 🔥 ICON + BADGE
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            AnimatedScale(
                              duration: const Duration(milliseconds: 200),
                              scale: isActive ? 1.15 : 1,
                              child: Icon(
                                icons[index],
                                size: iconSize,
                                color: isActive
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            ),

                            if (index == 2 && notifCount > 0)
                              Positioned(
                                right: -5,
                                top: -3,
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    notifCount.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: fontSize - 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        SizedBox(height: screenWidth < 360 ? 2 : 4),

                        // 🔥 TEXT
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: isActive
                                ? primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}