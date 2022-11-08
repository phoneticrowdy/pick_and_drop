import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pick_and_drop/database.dart';
import 'dart:convert';
import 'HOME.dart';

// Signup Api
userData(context, dob, gender, email, firstname, lastname, idnumber, username,
    password, phone) async {
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
        "userIdnumber": idnumber,
        "userPassword": password,
        "userName": username
      }));
  print(firstname);
  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['message'] == "Successfully Signup!") {
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
userLogin(context, username, password) async {
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

    if (decodedResponse['message'] == "Successfully Login!") {
      print(decodedResponse['message']);
      userDataFetch('1000');
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MyHomePage()));
    }
    return true;
  }
}

// data fetch api

var localData = LocalData();
var data;
userDataFetch(userId) async {
  http.Response response;
  response = await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/fetchUD.php"),
      body: jsonEncode({
        "userId": userId,
      })) as http.Response;
  print("fetching");
  if (response.statusCode == 200) {
    var database = LocalDatabase();
    var decodedResponse = json.decode(response.body);
    data = decodedResponse;
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
    localData.userName = data['userName'].toString();

    await database.tableIsEmpty(localData);
    //  await database.insertData(localData);
    print(localData.userEmail);
  } else {
    print("300");
  }
}

// take ride api

takeride(context, Ridedate, Ridetime, pickloc, droploc, prepartner,
    mobilenot) async {
  print("hey boi take ride");
  http.Response response;
  response = await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/takeride.php"),
      body: jsonEncode({
        "userId": null,
        "userPhone": mobilenot,
        "preferredPartner": prepartner,
        "pickupLocationId": pickloc,
        "destinationLocationId": droploc,
        "RideTime": Ridetime,
        "RideDate": Ridedate
      }));
  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    print(decodedResponse['message']);
    fetchride(Ridedate, Ridetime, pickloc, droploc, prepartner, mobilenot);
    if (decodedResponse['message'] == "data recieved") {
      print(decodedResponse['message']);
      userDataFetch('1000');
      Navigator.pushNamed(context, '');
    }
    return true;
  }
}

// giveride Api

giveride(context, Ridedateg, Ridetimeg, plocg, dlocg, vtypeg, ppartnerg, vmodel,
    vnumber, phoneg) async {
  http.Response response;
  response = await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/giveride.php"),
      body: jsonEncode({
        "userId": null,
        "vehicalType": vtypeg,
        "vehicalMode": vmodel,
        "vehicalNumber": vnumber,
        "startingLocationId": plocg,
        "destinationLocationId": dlocg,
        "RideDate": Ridedateg,
        "RideTime": Ridetimeg,
        "prefferedpartner": ppartnerg
      }));
  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    print(decodedResponse['message']);
    if (decodedResponse['message'] == "data recieved") {
      print(decodedResponse['message']);
      userDataFetch('1000');
      Navigator.pushNamed(context, '');
    }
    return true;
  }
}

// fetch ride or algo

fetchride(Ridedate, Ridetime, pickloc, droploc, prepartner, mobilenot) async {
  http.Response response;
  response = await http.post(
      Uri.parse(
          "https://travelwithphonetic.000webhostapp.com/Api/User/algo.php"),
      body: jsonEncode({
        "preferredPartner": prepartner,
        "pickupLocationId": pickloc,
        "destinationLocationId": droploc,
        "RideTime": Ridetime,
        "RideDate": Ridedate,
        "mobileno": mobilenot
      }));
  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    print(decodedResponse['message']);
    // if(decodedResponse['message']=="Successfully Login!"){
    //   print(decodedResponse['message']);
    //   userDataFetch('1000');
    //    Navigator.push(
    //                    context, MaterialPageRoute(builder: (_) => const MyHomePage()));
    //               }
    return true;
  }
}
