import 'package:admin_app/bloc/login_bloc/login_bloc.dart';
import 'package:admin_app/components/colors.dart';
import 'package:admin_app/components/config.dart';
import 'package:admin_app/components/size_config.dart';
import 'package:admin_app/ui/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List itemList = [
    "Profile",
    "Add Member",
    "Add Sub-Member",
    "Manage Member",
    "Member Enquiry",
    "Member Enquiry",
    "Manage Reward points",
    "Manage Bills",
    "Manage Account"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.white,

      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: COLORS.white,
        ),
        leading: Container(),
        title: Text(
          "Admin Profile",
          style: TextStyle(
            color: COLORS.lightBlack,
            fontSize: SizeConfig.blockWidth * 4.5,
            fontWeight: FontWeight.w600,
            fontFamily: 'Lato',
          ),
        ),
        backgroundColor: COLORS.white,
        centerTitle: false,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.8),
          child: Container(
            decoration: const BoxDecoration(
              color: COLORS.white,
              border: Border(bottom: BorderSide(color: COLORS.lightWhite)),
              boxShadow: [
                BoxShadow(
                  color: COLORS.lightWhite,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockHeight * 2,
                left: SizeConfig.blockWidth * 4,
                right: SizeConfig.blockWidth * 4),
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.blockWidth * 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/profile.png",
                        width: SizeConfig.blockWidth * 20,
                        height: SizeConfig.blockHeight * 15,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        "Super Admin",
                        style: TextStyle(
                          color: COLORS.lightBlack,
                          fontSize: SizeConfig.blockWidth * 5,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lato',
                        ),
                      ),
                      Text(
                        "Rajesh · C32EL917 ",
                        style: TextStyle(
                          color: COLORS.lightBlack,
                          fontSize: SizeConfig.blockWidth * 4.2,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 5,
                    bottom: SizeConfig.blockHeight * 5,
                  ),
                  decoration: BoxDecoration(
                    color: COLORS.white,
                    border: Border.all(
                      color: COLORS.lightWhite,
                      width: 0.4,
                    ),
                    borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 1.5),
                    boxShadow: const [
                      BoxShadow(
                        color: COLORS.lightWhite,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: itemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      itemList[index],
                                      style: TextStyle(
                                        color: COLORS.lightBlack,
                                        fontSize: SizeConfig.blockWidth * 4.2,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: COLORS.yellow,
                                      size: SizeConfig.blockWidth * 4,
                                    )
                                  ],
                                ),
                              ),
                              const Divider(color: Color(0xffF3E4B5)),
                            ],
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Config.accessToken = "";
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => LoginBloc(),
                                          child: const LoginScreen(),
                                        )));
                          });
                        },
                        child: SizedBox(
                          height: SizeConfig.blockHeight * 10,
                          width: SizeConfig.blockWidth * 20,
                          child: Image.asset("assets/images/logout.png", fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
