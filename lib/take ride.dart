// import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_field/date_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';
import 'package:pick_and_drop/Style/my_strings.dart';
import 'Style/Constant.dart';
import 'Apis.dart';

class Takeride extends StatefulWidget {
  const Takeride({Key? key}) : super(key: key);
  @override
  _TakerideState createState() => _TakerideState();
}

var _formkey_editProfile = GlobalKey<FormState>();
final List<String> genderItems = [
  'Male',
  'Female',
];
final List<String> pickupLocationItems = ['Nausadh', 'padri'];
final List<String> destinationLocationItems = ['dharmsala', 'khajanchi'];

String? selectedValue;

final _formKey = GlobalKey<FormState>();

class _TakerideState extends State<Takeride> {
  String? dropdownValue;
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
                      "Booking a Ride",
                      style: TextStyle(
                          fontFamily: montserrat_bold,
                          fontSize: 22,
                          color: black_163351),
                    ),
                  ),
                  SizedBox(
                    height: 27.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: DateTimeFormField(
                      // decoration: const InputDecoration(
                      //   hintStyle: TextStyle(color: Colors.black45),
                      //   errorStyle: TextStyle(color: Colors.redAccent),
                      //   border: OutlineInputBorder(),
                      //   suffixIcon: Icon(Icons.event_note),
                      //   labelText: 'Only time',

                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 15, bottom: 15),
                        labelText: "Ride Date",
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: black_163351, width: 1)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: gray_9d9d9d, width: 1)),
                      ),

                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: DateTimeFormField(
                      // decoration: const InputDecoration(
                      //   hintStyle: TextStyle(color: Colors.black45),
                      //   errorStyle: TextStyle(color: Colors.redAccent),
                      //   border: OutlineInputBorder(),
                      //   suffixIcon: Icon(Icons.event_note),
                      //   labelText: 'Only time',

                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 15, bottom: 15),
                        labelText: "Ride Time",
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: black_163351, width: 1)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: gray_9d9d9d, width: 1)),
                      ),

                      mode: DateTimeFieldPickerMode.time,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime value) {
                        print(value);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 15, bottom: 15),
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: black_163351, width: 1)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: gray_9d9d9d, width: 1)),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Pickup Location',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 20,
                      buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: pickupLocationItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select pickup Location .';
                        }
                      },
                      onChanged: (value) {
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 15, bottom: 15),
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: black_163351, width: 1)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: gray_9d9d9d, width: 1)),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Destination Location',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 20,
                      buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: destinationLocationItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select destination location.';
                        }
                      },
                      onChanged: (value) {
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 15, bottom: 15),
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
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: black_163351, width: 1)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(color: gray_9d9d9d, width: 1)),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Preffered Pertner',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 20,
                      buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: genderItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please Preffered Partner.';
                        }
                      },
                      onChanged: (value) {
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                    ),
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
                        // controller: userPhone,
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

                            // userData();
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
