import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class TitleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
       crossAxisAlignment: CrossAxisAlignment.end,
       children: <Widget>[
          Text(
             'TODAY ',
             style: GoogleFonts.saira(
                fontSize: SizeConfig.blockSizeVertical * 3,
                color: kTextPrimaryMainColor,
                fontWeight: FontWeight.bold,
             ),
          ),
          Text(
             'NOTE',
             style: GoogleFonts.saira(
                 fontSize: SizeConfig.blockSizeVertical * 3,
                 color: kAccendMainColor,
                 fontWeight: FontWeight.bold),
          ),
       ],
    );
  }
}
