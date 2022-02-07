import 'package:ecassion/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    _tweenSize = Tween(begin: 0.1, end: 100);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      });
    _animationSize = _tweenSize.animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationSize,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 600),
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
