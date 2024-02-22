import 'dart:async';
import 'package:flutter/material.dart';
import 'package:admin_app/components/colors.dart';
import 'package:admin_app/components/size_config.dart';
import 'package:admin_app/helpers/reuse_widget.dart';
import 'package:admin_app/ui/auth/pre_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 10,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();

    _waveAnimation = Tween<double>(
      begin: 10,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Timer(const Duration(seconds: 4), () => _navigateToNextScreen());
  }

  void _navigateToNextScreen() {
    _controller.reverse();
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PreLoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: COLORS.white,
      appBar: actionBar(context: context),
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Stack(
            children: [
              Positioned(
                top: SizeConfig.blockHeight * 55,
                left: SizeConfig.blockWidth * 0,
                child: Container(
                  height: SizeConfig.blockHeight * 30,
                  width: SizeConfig.blockHeight * 35,
                  margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 1),
                  child: Image.asset(
                    "assets/images/splashBg.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: child,
                      );
                    },
                    child: Container(
                      height: SizeConfig.blockHeight * 22,
                      width: SizeConfig.blockHeight * 56,
                      margin:
                      EdgeInsets.only(bottom: SizeConfig.blockHeight * 1),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  Text(
                    "It All Begins Here!!!",
                    style: TextStyle(
                      color: COLORS.black,
                      fontFamily: "lato",
                      fontSize: SizeConfig.blockWidth * 4,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              0.0,
              SizeConfig.blockHeight * 5 * (1 - _waveAnimation.value),
            ),
            child: child,
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: SizeConfig.blockHeight * 0.5,
              horizontal: SizeConfig.blockWidth * 0.5),
          child: Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

