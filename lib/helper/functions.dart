import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projecttodoapp/helper/size_config.dart';

import 'constants.dart';
import 'custom_picker.dart';

Future<DateTime> tripEditModalBottomSheet(BuildContext context) async {
  return await DatePicker.showPicker(
    context,
    showTitleActions: true,
    theme: DatePickerTheme(
      containerHeight: 210.0,
      cancelStyle: GoogleFonts.saira(
        fontWeight: FontWeight.normal,
        color: kTextSecondaryMainColor,
        fontSize: SizeConfig.blockSizeVertical * 2.5,
      ),
      doneStyle: GoogleFonts.saira(
        fontWeight: FontWeight.normal,
        color: kAccendMainColor,
        fontSize: SizeConfig.blockSizeVertical * 2.5,
      ),
    ),
    onConfirm: (time) {
      String formattedDate = DateFormat('HH:mm').format(time);
      print('confirm $formattedDate');
      return _showBottomSheetCreateTodo(context, formattedDate);
    },
    pickerModel: CustomPicker(
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    ),
  );
}

Future<Map<String, String>> _showBottomSheetCreateTodo(
    BuildContext context, String time) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
         content: Container(
             width: MediaQuery.of(context).size.width / 1.3,
             height: MediaQuery.of(context).size.height / 2.5,
             decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
                borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
             ),
             child: //Contents here
         ),
      );
    },
  );
}
/*Future<Map<String, String>> _showBottomSheetCreateTodo(
    BuildContext context, String time) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        height: SizeConfig.blockSizeHorizontal * 250,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.saira(
                        fontWeight: FontWeight.normal,
                        color: kTextSecondaryMainColor,
                        fontSize: SizeConfig.blockSizeVertical * 2.5,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Done",
                      style: GoogleFonts.saira(
                          fontWeight: FontWeight.normal,
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          color: kAccendMainColor),
                    ),
                  ),
                ],
              ),

              */ /*thiet lap widget modal input todo*/ /*
              Container(
                  margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1.5),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Input Todo',
                          labelStyle: GoogleFonts.saira(
                              fontWeight: FontWeight.normal,
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              color: kAccendMainColor),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    },
  );
}*/
