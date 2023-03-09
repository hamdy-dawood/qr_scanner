import 'package:flutter/material.dart';

import '../qr_create/view.dart';
import '../qr_scan/view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 0;
  List screens = const [
    QrScanView(),
    QrCreateView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xff005Bc1),
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.qr_code_scanner),
            ),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.qr_code_2),
            ),
            label: 'Generate QR',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        elevation: 15.0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
