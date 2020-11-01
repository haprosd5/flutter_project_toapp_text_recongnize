import 'package:flutter/material.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class ItemTodoList extends StatefulWidget {
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
  _ItemTodoListState createState() => _ItemTodoListState();
}

class _ItemTodoListState extends State<ItemTodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeHorizontal * 1,
          bottom: SizeConfig.blockSizeHorizontal * 1),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Icon(
                widget.icon,
                color: !widget.status ? kAccendMainColor : Colors.amberAccent,
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
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          fontWeight: FontWeight.bold,
                          color: kTextPrimaryMainColor),
                    ),

                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: kAccendMainColor,
                          size: SizeConfig.blockSizeVertical * 2.2,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeVertical * 1,
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              color: kTextSecondaryMainColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Divider()
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
