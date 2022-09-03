import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';
import 'package:pick_and_drop/Style/my_strings.dart';
import 'Style/Constant.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

final firstName = TextEditingController();
final lastName = TextEditingController();
final mobileNo = TextEditingController();
final email = TextEditingController();
var _formkey_editProfile = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
  String? dropdownValue;
  String? dropdownValue_location;
  bool isLayoutFirst = false;

  // String? value;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: statusbar_f8f8f8, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Form(
          key: _formkey_editProfile,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 22.7.h, left: 20.7.w),
                    child: InkWell(
                      child: SvgPicture.asset(
                        icon_back,
                        height: 15.h,
                        width: 21.3.w,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32.3, left: 20.7),
                    child: Text(
                      str_my_profile,
                      style: TextStyle(
                          fontFamily: montserrat_bold,
                          fontSize: 18.3,
                          color: black_163351),
                    ),
                  ),
                  SizedBox(
                    height: 27.5.h,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundColor: gray_e2e2e2,
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              img_logo,
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 3.h),
                            child: SvgPicture.asset(
                              icon_plus,
                              width: 18.5.w,
                              height: 18.5.h,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 26.w, right: 26.w, top: 30.h),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          if (!RegExp(r"[a-zA-Z]").hasMatch(value) ||
                              RegExp(r"[0-9]").hasMatch(value)) {
                            return 'Please enter valid first name';
                          }
                          return null;
                        },
                        controller: firstName,
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 20.w, top: 15.h, bottom: 15.h),
                          labelText: str_first_name,
                          labelStyle: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_first_name,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1.w)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1.w)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 26.w, right: 26.w, top: 30.h),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          if (!RegExp(r"[a-zA-Z]").hasMatch(value) ||
                              RegExp(r"[0-9]").hasMatch(value)) {
                            return 'Please enter valid last name';
                          }
                          return null;
                        },
                        controller: lastName,
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 20.w, top: 15.h, bottom: 15.h),
                          labelText: str_last_name,
                          labelStyle: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_last_name,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1.w)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1.w)),
                        )),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 26.w, right: 26.w, top: 16.5.h),
                    child: TextFormField(
                        enabled: false,
                        initialValue: "Email",
                        style: TextStyle(color: Colors.grey),
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 20.w, top: 15.h, bottom: 15.h),
                          labelText: str_e_mail,
                          labelStyle: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_enter_mail,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1.w)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1.w)),
                        )),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 26.w, right: 26.w, top: 16.5.h),
                    child: TextFormField(
                        enabled: false,
                        initialValue: "pata nahi yrr",
                        cursorColor: gray_9d9d9d,
                        style: TextStyle(color: Colors.grey),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 20.w, top: 15.h, bottom: 15.h),
                          labelText: str_company_name,
                          labelStyle: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_comapany_name,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1.w)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1.w)),
                        )),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 26.w, right: 26.w, top: 16.5.h),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number';
                          }
                          if (!RegExp(r"[0-9]").hasMatch(value) ||
                              RegExp(r"[a-zA-Z]").hasMatch(value)) {
                            return 'Please enter valid number';
                          }
                          if (value.length != 10) {
                            return 'Mobile Number must be of 10 digit';
                          }
                          return null;
                        },
                        controller: mobileNo,
                        maxLength: 10,
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 20.w, top: 15.h, bottom: 15.h),
                          labelText: str_mobile_number,
                          labelStyle: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_enter_mobile_number,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1.w)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1.w)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 26.w, right: 26.w, top: 26.h),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text(
                            str_save,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: sfpro_text_medium),
                          ),
                          onPressed: () {
                            if (_formkey_editProfile.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: btn_black_0b0b0b,
                            onPrimary: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              // side: BorderSide(color: skygreen_24d39e, width: 0),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 27.5.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
