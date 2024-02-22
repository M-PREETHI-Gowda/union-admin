import 'package:admin_app/bloc/login_bloc/login_bloc.dart';
import 'package:admin_app/components/colors.dart';
import 'package:admin_app/components/size_config.dart';
import 'package:admin_app/helpers/reuse_widget.dart';
import 'package:admin_app/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({super.key});

  @override
  State<PreLoginScreen> createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            fit: BoxFit.cover,
            height: SizeConfig.blockHeight*84,
          ),
          Column(
            children: [
              SizedBox(
                height: SizeConfig.blockHeight * 79.8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth*8),
                child: Text(
                  'Curated Collection of Experiences and Benefits',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: COLORS.whiteLight,
                    fontSize: SizeConfig.blockWidth * 4.6,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                    letterSpacing: SizeConfig.blockWidth * 0.2,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockHeight * 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockHeight * 1.5,
                  horizontal: SizeConfig.blockWidth * 4,
                ),
                child: enableButton(
                  buttonEnabled: true,
                  enableColor: COLORS.blackLight,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlocProvider(
                      create: (context) => LoginBloc(),
                      child: const LoginScreen(),
                    ))); },
                  text: "Login",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
