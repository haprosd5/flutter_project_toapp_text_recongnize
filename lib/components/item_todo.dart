import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/blocs/todo_bloc/todo_bloc.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class ItemTodoList extends StatefulWidget {
  final TodoEntity task;

  ItemTodoList({this.task});

  @override
  _ItemTodoListState createState() => _ItemTodoListState();
}

class _ItemTodoListState extends State<ItemTodoList> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      /* thiet lap giao dien cho item task*/
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
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _mapColorStatus(widget.task.status),
                  shape: BoxShape.circle,
                  border: Border.all(color: kPrimaryMainColor, width: 2),
                  /* boxShadow: [
                    BoxShadow(
                      color: kAccendMainColor,
                      offset: Offset(0.0, 0.5), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],*/
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
                    widget.task.title,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 2.5,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.task.updateAt,
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
            left: SizeConfig.blockSizeHorizontal * 4,
            //right: SizeConfig.blockSizeHorizontal * 2,
          ),
          child: IconSlideAction(
            caption: 'Complete',
            color: kAccendMainColor,
            foregroundColor: kPrimaryMainColor,
            icon: Icons.check_box,
            onTap: () {
              _listenComplete(context, widget.task);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.blockSizeHorizontal * 2,
            left: SizeConfig.blockSizeHorizontal * 1,
            right: SizeConfig.blockSizeHorizontal * 2,
          ),
          decoration: BoxDecoration(
            //shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconSlideAction(
            caption: 'Delete',
            color: kColorRed,
            foregroundColor: kPrimaryMainColor,
            icon: Icons.delete_forever,
            onTap: () {
              _listenDelete(context, widget.task.id);
            },
          ),
        ),
      ],
    );
  }

  /*xử lý các sự kiện
  * 1. hoàn thành
  * 2. Xoa item
  * 3. thiet lap color cho item task
  * */

  void _listenComplete(BuildContext context, TodoEntity task) {
    TodoEntity temp = TodoEntity(
        id: task.id,
        title: task.title,
        createdAt: task.createdAt,
        status: 0,
        updateAt: task.updateAt);
    BlocProvider.of<TodoBloc>(context).add(TodoEditEvent(task: temp));
  }

  void _listenDelete(BuildContext context, int id) {
    BlocProvider.of<TodoBloc>(context).add(TodoDeleteEvent(id: id));
  }

  Color _mapColorStatus(int input) {
    if (input == 1) {
      return kColorYellow;
    }
    if (input == 0) {
      return kColorGreen;
    }
    return kColorRed;
  }
}
