import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utility.dart';
import '../landing/landing_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Tween<double> _tweenSize;
  late Animation<double> _animationSize;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _setUpAnimation(context);
  }

  void _setUpAnimation(BuildContext context) {
    _tweenSize = Tween(begin: 0.1, end: 100);
    _animationController =
        AnimationController(vsync: this, duration: loadRandomDuration())
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            }
          });
    _animationSize = _tweenSize.animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.removeStatusListener((status) {});
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationSize,
        builder: (context, child) {
          return AnimatedContainer(
            duration: loadRandomDuration(),
            color: Color.fromRGBO(101, 100, 219, 1 / _animationSize.value),
            child: Center(
              child: SvgPicture.asset(
                "images/splash_logo.svg",
                height: _animationSize.value,
                width: _animationSize.value,
              ),
            ),
          );
        },
      ),
    );
  }
}
