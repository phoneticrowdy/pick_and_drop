import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';
import 'package:pick_and_drop/Style/my_strings.dart';
import 'Style/Constant.dart';
import 'Apis.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

const List<String> list = <String>['Male', 'Female', 'Other'];
const List<String> list_age = <String>[
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24'
];
var dropdownValue_gender = list.first;
var dropdownValue_age = list_age.first;

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
                    margin: EdgeInsets.only(top: 0, left: 20.7),
                    child: InkWell(
                      child: SvgPicture.asset(
                        icon_back,
                        height: 15,
                        width: 21.3,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32.3, left: 20.7),
                    child: Text(
                      "Creating Account",
                      style: TextStyle(
                          fontFamily: montserrat_bold,
                          fontSize: 22,
                          color: black_163351),
                    ),
                  ),
                  SizedBox(
                    height: 27.5,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: gray_e2e2e2,
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              img_logo,
                              width: 80,
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 3),
                            child: SvgPicture.asset(
                              icon_plus,
                              width: 18.5,
                              height: 18.5,
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            left: 18,
                          ),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            //  
                            hint: Text("Gender"),
                            iconSize: 30,

                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.deepPurple, fontSize: 30),
                            // underline: Container(
                            //   height: 2,
                            //   color: Colors.deepPurpleAccent,
                            // ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                      SizedBox(
                        width: 120,
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(
                      //       right: 18,
                      //     ),
                      //     child: DropdownButton<String>(
                      //       value: dropdownValue,
                      //       hint: Text("Age "),
                      //       menuMaxHeight: 150,
                      //       iconSize: 30,
                      //       icon: const Icon(Icons.arrow_downward),
                      //       elevation: 16,
                      //       style: const TextStyle(
                      //           color: Colors.deepPurple, fontSize: 30),
                      //       // underline: Container(
                      //       //   height: 2,
                      //       //   color: Colors.deepPurpleAccent,
                      //       // ),
                      //       onChanged: (String? value) {
                      //         // This is called when the user selects an item.
                      //         setState(() {
                      //           dropdownValue_age = value!;
                      //         });
                      //       },
                      //       items: list_age
                      //           .map<DropdownMenuItem<String>>((String value) {
                      //         return DropdownMenuItem<String>(
                      //           value: value,
                      //           child: Text(value),
                      //         );
                      //       }).toList(),
                      //     )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 30),
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
                        controller: userFirstname,
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: str_first_name,
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_first_name,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 30),
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
                        controller: userLastname,
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: str_last_name,
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_last_name,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 16.5),
                    child: TextFormField(
                        // enabled: false,
                        initialValue: "Adhaar Number",
                        controller: userIdnumber,
                        // style: TextStyle(color: Colors.black),
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: "ID Number",
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_enter_mail,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 16.5),
                    child: TextFormField(
                        // enabled: false,
                        controller: userEmail,
                        initialValue: "jhon@gmail.com",
                        // style: TextStyle(color: Colors.black),
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: str_e_mail,
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_enter_mail,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 16.5),
                    child: TextFormField(
                        // enabled: false,
                        initialValue: "",
                        // style: TextStyle(color: Colors.black),
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: str_e_mail,
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_enter_mail,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 16.5),
                    child: TextFormField(
                        // enabled: false,
                        initialValue: "Jhone@gmail.com",
                        controller: userPassword,
                        // style: TextStyle(color: Colors.black),
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_enter_mail,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 16.5),
                    child: TextFormField(
                        initialValue: "username",
                        controller: userName,
                        cursorColor: gray_9d9d9d,
                        // style: TextStyle(color: Colors.grey),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: "Username",
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_comapany_name,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 16.5),
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
                        controller: userPhone,
                        maxLength: 10,
                        cursorColor: gray_9d9d9d,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: str_mobile_number,
                          labelStyle: TextStyle(
                              fontSize: 12.5,
                              fontFamily: sfpro_text_regular,
                              color: black_163351),
                          hintText: str_enter_mobile_number,
                          floatingLabelStyle: TextStyle(
                              color: black_163351,
                              fontFamily: sfpro_text_medium,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 26),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text(
                            str_save,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: sfpro_text_medium),
                          ),
                          onPressed: () {
                            if (_formkey_editProfile.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }

                            userData();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: btn_black_0b0b0b,
                            onPrimary: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              // side: BorderSide(color: skygreen_24d39e, width: 0),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 27.5,
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
