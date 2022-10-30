import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pick_and_drop/database.dart';
import 'dart:convert';

import 'package:pick_and_drop/signup.dart';
import 'HOME.dart';
import 'signup.dart';

var userId = 1010;
var userDob = "2003/05/09";
var userActive;
var userGender ;
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





// Login Api
userLogin(context,username,password) async {
  http.Response response;
  response = await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/login.php"),
      body: jsonEncode({     
        "userName": username,
        "userPassword": password,
      }));
   if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    
    if(decodedResponse['message']=="Successfully Login!"){
      print(decodedResponse['message']);
      userDataFetch('1000');
      print("sucee");
       Navigator.push(
                       context, MaterialPageRoute(builder: (_) => MyHomePage()));
                  }
      return true;    
    
   
    
  }
}



// data fetch api

var localData=LocalData();
var data;
userDataFetch(userId) async {
  http.Response response;
  response =   await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/fetchUD.php"),
      body: jsonEncode({     
        "userId": userId,
      })) as http.Response;
      print("fetching");
   if (response.statusCode == 200) {
    var database=LocalDatabase();
    var decodedResponse = json.decode(response.body);
    data=decodedResponse;
    print(data);
    localData.userId = data['userId'].toString();
    localData.userDob = data['userDob'].toString();
    localData.userActive = data['userActive'].toString();
    localData.userGender = data['userGender'].toString();
    localData.userFirstname = data['userFirstname'].toString();
    localData.userLastname = data['userLastname'].toString();
    localData.userEmail = data['userEmail'].toString();
    localData.userPhone = data['userPhone'].toString();
    localData.userIdnumber = data['userIdnumber'].toString();
    localData.userPassword = data['userPassword '].toString();
    localData.userName= data['userName'].toString();

   await database.insertData(localData);
   print(localData.userEmail);

    
    // if(decodedResponse['message']=="Successfully Login!"){
    //   print(decodedResponse['message']);
    //    Navigator.push(
    //                    context, MaterialPageRoute(builder: (_) => MyHomePage()));
    //               }
    //   return true;    
    
   
    
  }
  else{print("300");}
}
