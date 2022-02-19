import 'package:ecassion/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/di/injection_container.dart';
import 'core/widgets/no_glow_scroll_behaviour.dart';

void main() async {
  await setUpInjector();
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
