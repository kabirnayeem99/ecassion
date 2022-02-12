import 'package:ecassion/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcassionApp());
}

class EcassionApp extends StatelessWidget {
  const EcassionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
