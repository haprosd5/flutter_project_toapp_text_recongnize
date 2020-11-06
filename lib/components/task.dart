import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class ItemTodoList extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final String time;
  final Color color;
  final bool status;

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
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        decoration: BoxDecoration(
          color: kAccendSubColor,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(
          top: SizeConfig.blockSizeHorizontal * 1.5,
        ),
        padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: kPrimaryMainColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.yellow[500], width: 2),
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.05,
            ),
            Flexible(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 2.5,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.time,
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: kTextPrimarySubColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      secondaryActions: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2,
            left: SizeConfig.blockSizeHorizontal * 5,
          ),
          child: IconSlideAction(
            caption: 'Complete',
            color: Colors.green,
            icon: Icons.check_box, 
            onTap: () => {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2,
            //right: SizeConfig.blockSizeHorizontal * 5,
          ),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
          child: IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete_forever,
            onTap: () => {},
          ),
        ),
      ],
    );
  }
}
