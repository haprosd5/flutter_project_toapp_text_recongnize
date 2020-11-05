import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projecttodoapp/components/dialog_addtodo.dart';
import 'package:projecttodoapp/helper/size_config.dart';

import 'constants.dart';
import 'custom_picker.dart';

Future<DateTime> tripEditModalBottomSheet(BuildContext context) async {
  return await DatePicker.showPicker(
    context,
    //showTitleActions: true,
    theme: DatePickerTheme(
      containerHeight: SizeConfig.blockSizeVertical * 30,
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
      if (_checkTimeBeforeAddTask(time)) {
        String formattedDate = DateFormat('HH:mm').format(time);
        return DialogHelper.exit(context, formattedDate);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'You select error time of task! Please',
              style: GoogleFonts.saira(
                fontWeight: FontWeight.normal,
                color: kPrimaryMainColor,
                fontSize: SizeConfig.blockSizeVertical * 2.5,
              ),
            ),
            backgroundColor: Colors.redAccent[200],
          ),
        );
      }
    },
    pickerModel: CustomPicker(
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    ),
  );
}

bool _checkTimeBeforeAddTask(DateTime time) {
  if (DateTime.now().isAfter(time)) return false;
  return true;
}
