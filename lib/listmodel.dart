import 'package:flutter/material.dart';

import 'Style/Constant.dart';
import 'Style/my_colors.dart';
import 'Style/my_icons.dart';

class AddressTypeModel {
  bool selected;
  String tvType, tvAddress;
  var userLocationId;
  var isDefault_flag;

  AddressTypeModel({
    required this.selected,
    required this.tvType,
    required this.tvAddress,
  });
}

class AddressType extends StatelessWidget {
  final AddressTypeModel model;
  AddressType(this.model);
  int myposition = 1;
  var default_address = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 150,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: gray_ebebeb, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.white,
            // color:myposition == model.selected ? gray_ebebeb : Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // this.model.selected
              // ? Image.asset(
              //     radio_active_button,
              //     height: 20,
              //     width: 20,
              //     color: pink_ff5465,
              //   )
              // : Image.asset(
              //     radio_on_button,
              //     height: 20,
              //     width: 20,
              //     color: gray_e8e8e8,
              //   ),
              SizedBox(
                width: 12.5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.tvType,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: sfpro_text_bold,
                              color: black_163351),
                        ),
                        // this.model.selected
                        //     ? Image.asset(star_fill,height: 20,width: 20,color: yellow_FFC800,)
                        //     : Image.asset(star_empty,height: 20,width: 20,color: gray_9d9d9d,),

                        model.isDefault_flag == "1"
                            ? Image.asset(
                                star_fill,
                                height: 15,
                                width: 15,
                                // color: gray_9d9d9d, //yellow
                                color: yellow_FFC800,
                              )
                            : Row(
                                children: [
                                  Image.asset(
                                    star_empty,
                                    height: 15,
                                    width: 15,
                                    color: gray_9d9d9d,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Text("Set Default"),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              children: [
                                                Container(
                                                  height: 160,
                                                  width: 450,
                                                  // child: PopupAlertDialog(
                                                  //   message:
                                                  //       str_msg_setdefault,
                                                  //   user_id: user_id,
                                                  //   userLocation_id:
                                                  //       model.userLocationId,
                                                  //   popup_flag: "2",
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ],
                              )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 250,
                      child: Text(
                        model.tvAddress,
                        style: TextStyle(
                            fontSize: 13.3,
                            fontFamily: sfpro_text_regular,
                            color: gray_9d9d9d),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Image.asset(
                        //   //  edit-- remove
                        //   img_edit,
                        //   height: 17,
                        //   width: 17,
                        //   color: blue_1f78e7,
                        // ),
                        const SizedBox(
                          width: 12,
                        ),
                        model.isDefault_flag != "1"
                            ? Container(
                                margin: const EdgeInsets.all(15),
                                child: InkWell(
                                  child: Image.asset(
                                    img_delete,
                                    height: 20,
                                    width: 20,
                                    color: pink_ff5465,
                                  ),
                                  onTap: () {
                                    // address_context = context;
                                    if (model.isDefault_flag != "1") {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              children: [
                                                Container(
                                                  height: 160,
                                                  width: 450,
                                                  // child: PopupAlertDialog(
                                                  //   message: str_message,
                                                  //   user_id: user_id,
                                                  //   userLocation_id:
                                                  //       model.userLocationId,
                                                  //   popup_flag: "1",
                                                )
                                                // ),
                                              ],
                                            );
                                          });
                                    } else {
                                      // showAlertDialog(address_context, "Alert",
                                      //     "Default address cant't be delete ?");
                                      // Navigator.pop(context);
                                    }
                                  },
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
