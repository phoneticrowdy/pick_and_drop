import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Style/Constant.dart';
import 'Style/my_colors.dart';
import 'Style/my_icons.dart';

class AddressTypeModel {
  bool selected;
  String tvType, tvAddress;

  AddressTypeModel({
    required this.selected,
    required this.tvType,
    required this.tvAddress,
  });
}

class AddressType extends StatelessWidget {
  // final AddressTypeModel model;
  // AddressType(this.model);
  int myposition = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/thar-exterior-right-front-three-quarter-11.jpg',
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                  'Anshu Singh                          Padari - khajanchi'),
              subtitle: Text('9:15AM-10:55AM'),
              // trailing: Icon(Icons.more_vert),
              isThreeLine: true,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
