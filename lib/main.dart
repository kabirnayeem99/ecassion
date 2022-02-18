import 'package:ecassion/core/di/injection_container.dart';
import 'package:ecassion/core/widgets/no_glow_scroll_behaviour.dart';
import 'package:ecassion/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  setUpInjector();
  runApp(const EcassionApp());
}

class EcassionApp extends StatelessWidget {
  const EcassionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoGlowScrollBehaviour(),
      home: const SplashPage(),
    );
  }
}
