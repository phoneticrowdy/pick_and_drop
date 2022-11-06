import 'package:pick_and_drop/Apis.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';




class LocalData {
  //coloumns...
  var userId = '1001';
  var userDob='2003-05-07';
  var userActive="1";
  var userGender='male';
  var userFirstname='Anshu';
  var userLastname="singh";
  var userEmail="prase@gmail.com";
  var userPhone="090909090";
  var userIdnumber="9876654332";
  var userPassword="hgg8g";
  var userName="Anshu@";
 
  Map<String, dynamic> toMap() {
    return {
      ' userId':  userId,
      'userDob': userDob,
      'userActive': userActive,
      'userGender': userGender,
      'userFirstname': userFirstname,
      'userLastname': userLastname,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'userIdnumber': userIdnumber,
      'userPassword': userPassword,
      'userName':userName,
      
    };
  }
}

class LocalDatabase {
  // ignore: prefer_typing_uninitialized_variables

  String table_name = 'user_data';
  Future<Database> setPath() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'pick&drop.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE  $table_name (userId TEXT , userDob TEXT , userActive TEXT , userGender TEXT , userFirstname TEXT, userLastname Text ,userEmail Text, userPhone TEXT , userIdnumber TEXT , userPassword TEXT, userName TEXT)',
        );
      },
      
      version: 1,
    );
    return database;
  }

  Future<void> insertData(LocalData localData) async {
    final db = await setPath();
    await db.insert(
      table_name,
      localData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  tableIsEmpty(LocalData localData) async {
    var db = await setPath();
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table_name'));
    print("count:-" + count.toString());
    if (count! < 1) {
      insertData(localData);
    }
    print(count);
  }

  getData() async {
    final db = await setPath();
    final maps = await db.query(table_name);
    print(maps);
    // data_fetched = true;
    return maps;
  }

  // Future<void> insert_to_user_profile(var values, table_name) async {
  //   final db = await setPath();
  //   count_data_set = await db.insert(
  //     table_name,
  //     values,
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  //   // print(count_rides);
  //   flag_rides++;
  //   user_data_fetched = true;
  // }

  // Future<void> insert_to_user_rides(var values, table_name) async {
  //   final db = await setPath();
  //   count_rides = await db.insert(
  //     table_name,
  //     values,
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  //   // print(count_rides);
  // }

  Future<void> create_shift_details(table) async {
    final db = await setPath();

    await db.execute(
        'CREATE TABLE IF NOT EXISTS $table (companyLocationId TEXT, shiftType TEXT,shiftTime TEXT,ID INTEGER PRIMARY KEY AUTOINCREMENT)');
  }

  getTableData(table_name) async {
    final db = await setPath();
    final maps = await db.query(table_name);
    return maps;
  }
//   void _createTableCompanyV1(Batch batch) {
//     batch.execute('DROP TABLE IF EXISTS Company');
//     batch.execute('''CREATE TABLE Company (
//     id INTEGER PRIMARY KEY AUTOINCREMENT,
//     name TEXT
// )''');
//   }

  check_existence(table) async {
    final db = await setPath();
    var data = await db.execute("SELECT * FROM $table;");
    return data;
  }

  Future<void> create_a_table(table) async {
    final db = await setPath();

    await db.execute(
        'CREATE TABLE IF NOT EXISTS $table (Salutation TEXT,firstName TEXT,lastName TEXT,email TEXT,mobileNo TEXT,city TEXT,siteName TEXT,userStatus INTEGER DEFAULT 1)');
  }

  Future<void> create_user_addresses(table) async {
    final db = await setPath();

    await db.execute(
        'CREATE TABLE IF NOT EXISTS $table (userLocationId TEXT,userId TEXT,addressLabel TEXT,buildingName TEXT,locationByGoogle TEXT,userSubLocality2 TEXT,userSubLocality1 TEXT,userLocality TEXT,lat TEXT,long TEXT,roadDistance TEXT,straightDistance TEXT,isDefault TEXT)');
  }

  Future<void> deleteData() async {
    final db = await setPath();
    await db.delete(
      table_name,
      // where: 'companyLocationId=?',
      // whereArgs: [id],
    );
  }

  Future<void> deleteUserData(table) async {
    final db = await setPath();
    await db.delete(
      table,
    );
  }

  // Future<void> updateData(rideId) async {
  //   final db = await setPath();
  //   int updateCount = await db.rawUpdate('''
  //   UPDATE $ridesTable 
  //   SET requestStatus = ?
  //   WHERE rideId = ?
  //   ''', [0, rideId]);
  //   flag_modify = true;
  //   print("update-returns:-" + updateCount.toString());
  // }

  // Future<void> modifyRideData(rideId) async {
  //   final db = await setPath();
  //   int updateCount = await db.rawUpdate('''
  //   UPDATE $ridesTable 
  //   SET requestStatus = ? , loginLogoutTime=?, companyLocationId=?, userLocationId=?
  //   WHERE rideId = ?
  //   ''', [
  //     1,
  //     selected_ride_time,
  //     comapany_location_id,
  //     user_location_id,
  //     rideId
  //   ]);
  //   ride_modified = true;
  //   print("update-returns:-" + updateCount.toString());
  // }

  // Future<void> deleteRide(rideId) async {
  //   final db = await setPath();
  //   var dmessage =
  //       await db.delete(ridesTable, where: 'rideId=?', whereArgs: [rideId]);
  //   print('DM:-' + dmessage.toString());
  // }

  Future<void> create_rides_table(table) async {
    final db = await setPath();

    await db.execute(
        'CREATE TABLE IF NOT EXISTS $table (rideId TEXT,type TEXT,date TEXT,loginDate TEXT,day TEXT,loginLogoutTime TEXT,requestStatus TEXT,rideOTP TEXT,pickupDateTime TEXT,pickupAddress Text , dropAddress TEXT,addressLabel TEXT,siteName TEXT,companyLocationId TEXT,userLocationId TEXT,companySubLocality2 TEXT,companySubLocality1 TEXT,companyLocality TEXT,userPremise TEXT,userSubLocality2 TEXT,userSubLocality1 TEXT,userLocality TEXT, driverFirstName TEXT, driverLastName TEXT, driverContactNo TEXT, vehicleType TEXT, vehicleNo TEXT, checkoutTime TEXT,homeLat TEXT,homeLong TEXT,companyLocationLat TEXT,companyLocationLong TEXT,driverId TEXT,checkoutDateTime TEXT,rideStatus TEXT)');
  }
}

//   scheduled rides

void perform() async {
  var data = LocalData();
  var database = LocalDatabase();
  database.setPath();
  await database.insertData(data);
  print(await database.getData());
}
