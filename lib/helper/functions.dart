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
      return DialogHelper.exit(context, formattedDate);
    },
    pickerModel: CustomPicker(
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    ),
  );
}
