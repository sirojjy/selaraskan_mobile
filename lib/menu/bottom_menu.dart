import 'package:flutter/material.dart';
import 'package:selaraskan_mobile/dashboard_upt/dashboard_upt.dart';
import 'package:selaraskan_mobile/menu_program/daftar_program.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SlidingClippedNavBar.colorful(
      backgroundColor: Colors.white,
      onButtonPressed: (index) {
        setState(() {
          selectedIndex = index;
        });
        // Handle navigation based on index
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DashboardUPTPage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DaftarProgram()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DaftarProgram()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DaftarProgram()),
          );
        }
      },
      iconSize: 30,
      selectedIndex: selectedIndex,
      barItems: <BarItem>[
        BarItem(
          icon: Icons.dashboard,
          title: 'Dashboard',
          activeColor: Colors.blue,
          inactiveColor: Colors.grey[600],
        ),
        BarItem(
          icon: Icons.app_registration,
          title: 'Program',
          activeColor: Colors.blue,
          inactiveColor: Colors.grey[600],
        ),
        BarItem(
          icon: Icons.beenhere,
          title: 'Hasil',
          activeColor: Colors.blue,
          inactiveColor: Colors.grey[600],
        ),
        BarItem(
          icon: Icons.filter,
          title: 'Galeri',
          activeColor: Colors.blue,
          inactiveColor: Colors.grey[600],
        ),
      ],
    );
  }
}
