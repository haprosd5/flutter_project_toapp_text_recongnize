import 'package:flutter/material.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class ItemTodoList extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String time;
  Color color;
  bool status;

  ItemTodoList(
      {this.description,
      this.icon,
      this.status,
      this.time,
      this.title,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: status ? Colors.amberAccent[50] : kPrimaryMainColor,
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeHorizontal * 1.5,
          bottom: SizeConfig.blockSizeHorizontal * 1.5),
      child: Container(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Icon(
                icon,
                color: !status ? kAccendMainColor : Colors.amberAccent,
                size: SizeConfig.blockSizeVertical * 3,
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.03,
            ),
            Flexible(
              flex: 10,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          fontWeight: FontWeight.bold,
                          color: kTextPrimaryMainColor),
                    ),

                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 1,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          color: kTextSecondaryMainColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
