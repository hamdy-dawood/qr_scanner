import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/bottom_nav_bar/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.windows,
      ),
      home: const NavBarView(),
    );
  }
}
