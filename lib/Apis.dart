import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pick_and_drop/database.dart';
import 'dart:convert';
import 'HOME.dart';


userData(context,dob,gender,email,firstname,lastname,idnumber,username,password,phone) async {
  http.Response response;
  response = await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/signup.php"),
      body: jsonEncode({
        "userId": null,
        "userDob": dob,
        "userActive": 1,
        "userGender": gender,
        "userFirstname": firstname,
        "userLastname": lastname,
        "userEmail": email,
        "userPhone": phone,
        "userIdnumber":idnumber,
        "userPassword": password,
        "userName": username
      }));
  print(firstname);

  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    if(decodedResponse['message']=="Successfully Signup!"){
      print("hey boi");
    userDataFetch('1000');
      print("sucee");
       Navigator.push(
                       context, MaterialPageRoute(builder: (_) => const MyHomePage()));
                  }
  }
    return;
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
       Navigator.push(
                       context, MaterialPageRoute(builder: (_) => const MyHomePage()));
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
  }
  else{print("300");}
}



// take ride api
// taker()