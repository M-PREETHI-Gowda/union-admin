import 'package:admin_app/bloc/profile_bloc/profile_bloc.dart';
import 'package:admin_app/components/colors.dart';
import 'package:admin_app/components/size_config.dart';
import 'package:admin_app/helpers/reuse_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ProfileBloc profileBloc;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    print('object');
  }

  void _showSuccessDialog() {
    String? selectedDate = 'February 20, 2024';
    String selectedTime = '9:00 AM';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockHeight * 30,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.blockWidth * 100,
                height: SizeConfig.blockHeight * 10,
                decoration: BoxDecoration(
                  color: COLORS.button,
                  borderRadius: BorderRadius.circular(SizeConfig.blockWidth*2)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:SizeConfig.blockWidth*4),
                      child: Text(
                        "Amenities Booking",
                        style: TextStyle(
                          color: COLORS.white,
                          fontFamily: 'Lato',
                          fontSize: SizeConfig.blockWidth * 4.2,
                          fontWeight: FontWeight.w400,
                          letterSpacing: SizeConfig.blockWidth * 0.2,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:EdgeInsets.only(right:SizeConfig.blockWidth*4),
                        child: Image.asset("assets/images/cancel.png",width: SizeConfig.blockWidth*4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockHeight * 1.5),
              Text(
                'Date',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: COLORS.black,
                  fontFamily: "Poppins",
                  fontSize: SizeConfig.blockWidth * 4.3,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: SizeConfig.blockHeight*0.5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: COLORS.greyLight,
                    width: SizeConfig.blockWidth*0.4,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButton<String>(
                  value: selectedDate!,
                  items: <String>[
                    'February 20, 2024',
                    'February 19, 2024',
                    'February 18, 2024',
                    'February 17, 2024'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    selectedDate = newValue!;
                  },
                  hint: Text('Select an option'),
                  underline: SizedBox(),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Time',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: COLORS.black,
                  fontFamily: "Poppins",
                  fontSize: SizeConfig.blockWidth * 4.3,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: SizeConfig.blockHeight*0.5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: COLORS.greyLight,
                    width: SizeConfig.blockWidth*0.4,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButton<String>(
                  value: selectedTime,
                  items: <String>[
                    '9:00 AM',
                    '10:15 AM',
                    '11:15 AM',
                    '12:15 PM'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTime = newValue!;
                    });
                  },
                  hint: Text('Select a time'),
                  underline: SizedBox(),
                ),

              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight*2),
                 padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight*2,horizontal: SizeConfig.blockWidth*10),
                  decoration: BoxDecoration(
                      color: Color(0xffDDA911),
                      borderRadius: BorderRadius.circular(SizeConfig.blockWidth*2)
                  ),
                  child:  Text(
                    "Save changes",
                    style: TextStyle(
                      color: COLORS.white,
                      fontFamily: 'Lato',
                      fontSize: SizeConfig.blockWidth * 4.2,
                      fontWeight: FontWeight.w400,
                      letterSpacing: SizeConfig.blockWidth * 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> itemList = [
    {
      'image': 'assets/images/dining.png',
      'title': 'Book Dining',
    },
    {
      'image': 'assets/images/fitness.png',
      'title': 'Fitness',
    },
    {
      'image': 'assets/images/kids.png',
      'title': 'Kids Zone',
    },
    {
      'image': 'assets/images/lounge.png',
      'title': 'Theatre Lounge',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.white,

      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
              child: const Center(
                child: CircularProgressIndicator(
                  color: COLORS.yellow,
                ),
              ),
            );
          }
          if (state is FetchProfileFailed) {
            return Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
              child: Center(
                child: Text(
                  "Something Went Wrong",
                  style: TextStyle(
                    color: COLORS.yellowLight,
                    fontSize: SizeConfig.blockWidth * 5,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            );
          }
          if (state is FetchProfileSuccess) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/homeBg.png",
                    fit: BoxFit.cover,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.blockHeight * 67,
                  ),
                  Positioned(
                    top: SizeConfig.blockHeight * 4.6,
                    left: 0,
                    right: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: SizeConfig.blockHeight * 15,
                              margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 1),
                              child: Image.asset("assets/images/logo.png")),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.blockHeight * 70,),
                        headingText(text: "Namaste ${state.firstName} ${state.lastName}"),
                        Text(
                          "Super Admin",
                          style: TextStyle(
                            color: COLORS.subTxt,
                            fontSize: SizeConfig.blockWidth * 3.6,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lato',
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            height: SizeConfig.blockHeight * 30,
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockHeight * 5.6,
                                bottom: SizeConfig.blockHeight * 3),
                            child: Column(
                              children: [
                                Image.asset("assets/images/total_member.png",
                                    height: SizeConfig.blockHeight * 22.6,
                                    width: SizeConfig.screenWidth),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                      SizeConfig.blockHeight * 0.8,
                                      horizontal:
                                      SizeConfig.blockWidth * 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffC89314),
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockWidth * 5),
                                  ),
                                  child: Text(
                                    "195",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: COLORS.white,
                                      fontSize: SizeConfig.blockWidth * 3.8,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          width: SizeConfig.blockWidth * 100,
                          margin: EdgeInsets.only(
                              bottom: SizeConfig.blockHeight * 5),
                          decoration: BoxDecoration(
                            color: COLORS.white,
                            border: Border.all(
                              color: COLORS.lightWhite, // Border color
                              width: 0.4, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockWidth * 1.5),
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
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight*3),
                                child: Text('Upcoming Reservations',style: TextStyle(
                                  color: COLORS.yellow,
                                  fontSize: SizeConfig.blockWidth * 4,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                              ),
                              Divider(color:  Color(0xffD5D5D5), height: SizeConfig.blockHeight*1),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight*3),
                                child: Text(
                                  "No upcoming booking are available",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: COLORS.lightBlack,
                                    fontSize: SizeConfig.blockWidth * 4,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          margin: EdgeInsets.only(
                              bottom: SizeConfig.blockHeight * 5),
                          decoration: BoxDecoration(
                            color: COLORS.white,
                            border: Border.all(
                              color: COLORS.lightWhite, // Border color
                              width: 0.4, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockWidth * 1.5),
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
                              Padding(
                                padding: EdgeInsets.only(top: SizeConfig.blockHeight*3),
                                child: Text('Upcoming Amenities Bookings',style: TextStyle(
                                  color: COLORS.yellow,
                                  fontSize: SizeConfig.blockWidth * 4,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                )),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _showSuccessDialog();
                                  });
                                },
                                child: SizedBox(
                                  height: SizeConfig.blockHeight * 22,
                                  width: SizeConfig.blockWidth*100,
                                  child: Image.asset("assets/images/calender.png",fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight * 22,
                                width: SizeConfig.blockWidth*100,
                                child: Image.asset("assets/images/event.png",fit: BoxFit.contain),
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight * 22,
                                width: SizeConfig.blockWidth*100,
                                child: Image.asset("assets/images/event.png",fit: BoxFit.contain),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget balanceTxt({required String text}) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xff969696),
        fontSize: SizeConfig.blockWidth * 3.2,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lato',
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
