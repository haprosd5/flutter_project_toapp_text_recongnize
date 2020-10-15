import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

// ignore: must_be_immutable
class ItemArrange extends StatelessWidget {
  String textState;
  String numArrange;
  Color arrowColor;
  Color textColor;
  IconData iconArrange;


  ItemArrange({this.textState, this.numArrange, this.arrowColor, this.textColor, this.iconArrange});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.blockSizeHorizontal * 24,

          child: Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 1.5, right: SizeConfig.blockSizeHorizontal * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Text(
                    textState,
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  numArrange,
                  style: GoogleFonts.saira(
                    fontSize: SizeConfig.blockSizeVertical * 2,
                    color: kPrimaryMainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Icon(
            iconArrange,
            size: SizeConfig.blockSizeHorizontal * 4,
            color: arrowColor,
          ),
          top: 0,
          right: 0,
        )
      ],
    );
  }
}
