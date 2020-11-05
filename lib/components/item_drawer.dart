import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class ItemDrawer extends StatelessWidget {
  final String name;
  final VoidCallback onPress;
  final IconData icon;

  ItemDrawer({this.name, this.onPress, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon, color: kAccendMainColor,
        ),
        SizedBox(width: SizeConfig.blockSizeHorizontal * 3,),
        GestureDetector(
          onTap: onPress,
          child: Text(
            name,
            style: GoogleFonts.saira(
                fontSize: SizeConfig.blockSizeVertical * 3,
                color: kTextPrimarySubColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
