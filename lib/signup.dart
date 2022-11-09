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

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

var dob;
var gender;
TextEditingController email = TextEditingController();
TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController idnumber = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController phone = TextEditingController();

var _formkey_editProfile = GlobalKey<FormState>();
final List<String> genderItems = [
  'Male',
  'Female',
];

String? selectedValue;

final _formKey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
  String? dropdownValue;
  String? dropdownValue_location;
  bool isLayoutFirst = false;

  void _fetchData(BuildContext context) async {
    // show the loading dialog
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });

    // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
    await Future.delayed(userData(
        context,
        dob.toString(),
        gender.toString(),
        email.text,
        firstname.text,
        lastname.text,
        idnumber.text,
        username.text,
        password.text,
        phone.text));

    // Close the dialog programmatically
    Navigator.of(context).pop();
  }

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

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.teal.shade100,
        toolbarHeight: 100,
        title: Text(
          "Creating Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: MaterialApp(
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32.3, left: 20.7),
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
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                      child: DateTimeFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, top: 15, bottom: 15),
                          labelText: "Date of Birth",
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
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {
                          // print(value);
                          dob = value;
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: black_163351, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide:
                                  BorderSide(color: gray_9d9d9d, width: 1)),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select Your Gender',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 30,
                        buttonHeight: 20,
                        buttonPadding:
                            const EdgeInsets.only(left: 0, right: 10),
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
                            return 'Please select gender.';
                          }
                        },
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                          gender = value.toString();
                        },
                        onSaved: (value) {
                          gender = value.toString();
                        },
                      ),
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
                          controller: firstname,
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
                          controller: lastname,
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
                          // initialValue: "Adhaar Number",
                          controller: idnumber,

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
                            hintText: "Eg. 12345",
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
                          controller: email,
                          // initialValue: "jhon@gmail.com",
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
                            hintText: "Anshu@gmail.com",
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
                          // initialValue: "",
                          // style: TextStyle(color: Colors.black),
                          cursorColor: gray_9d9d9d,
                          controller: username,
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
                            hintText: "Eg: phonetic@",
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
                          // initialValue: "Jhone@gmail.com",
                          controller: password,
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
                            hintText: "Anshu@10",
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
                    // Container(
                    //   margin: EdgeInsets.only(left: 15, right: 15, top: 16.5),
                    //   child: TextFormField(
                    //       initialValue: "username",
                    //       controller: userName,
                    //       cursorColor: gray_9d9d9d,
                    //       // style: TextStyle(color: Colors.grey),
                    //       keyboardType: TextInputType.emailAddress,
                    //       textInputAction: TextInputAction.next,
                    //       decoration: InputDecoration(
                    //         contentPadding:
                    //             EdgeInsets.only(left: 20, top: 15, bottom: 15),
                    //         labelText: "Username",
                    //         labelStyle: TextStyle(
                    //             fontSize: 12.5,
                    //             fontFamily: sfpro_text_regular,
                    //             color: black_163351),
                    //         hintText: str_comapany_name,
                    //         floatingLabelStyle: TextStyle(
                    //             color: black_163351,
                    //             fontFamily: sfpro_text_medium,
                    //             fontSize: 14),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(6)),
                    //             borderSide:
                    //                 BorderSide(color: black_163351, width: 1)),
                    //         border: OutlineInputBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(6)),
                    //             borderSide:
                    //                 BorderSide(color: gray_9d9d9d, width: 1)),
                    //       )),
                    // ),
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
                          controller: phone,
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
                              if (_formkey_editProfile.currentState!
                                  .validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                              _fetchData(context);
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
      ),
    );
  }
}
