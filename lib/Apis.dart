import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pick_and_drop/signup.dart';
import 'signup.dart';

var userId = 1010;
var userDob = "2003/05/09";
var userActive;
var userGender = dropdownValue_gender;
var userFirstname;
var userLastname;
var userEmail;
var userPhone;
var userIdnumber;
var userPassword;
var userName;

userData() async {
  http.Response response;
  response = await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/signup.php"),
      body: jsonEncode({
        "userId": userId,
        "userDob": userDob,
        "userActive": 1,
        "userGender": userGender,
        "userFirstname": userFirstname,
        "userLastname": userLastname,
        "userEmail": userEmail,
        "userPhone": userPhone,
        "userIdnumber": userIdnumber,
        "userPassword": userPassword,
        "userName": userName
      }));
  print(userFirstname);
  print(userGender);
  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    print(decodedResponse['message']);
    return;
  }
}
