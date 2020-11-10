import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/blocs/todo_bloc/todo_bloc.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';
import 'package:projecttodoapp/components/item_arrange.dart';
import 'package:projecttodoapp/components/item_todo.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';
import 'package:projecttodoapp/pages/initial_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 20,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 0.6],
                    colors: [kAccendMainColor, Colors.cyan],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Text(
                    'HELLO MR,HA !!',
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 3,
                      color: kPrimaryMainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Yesterday's work situation",
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: kPrimaryMainColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                 /* SizedBox(
                    height: SizeConfig.blockSizeVertical * 1.5,
                  ),
                  Text(
                    'Report yesterday',
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 3,
                      color: kPrimaryMainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),*/

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ItemArrange(
                        arrowColor: kColorGreen,
                        iconArrange: Icons.arrow_upward,
                        textState: 'Suceess: ',
                        textColor: kColorGreen,
                        numArrange: '12',
                      ),
                      ItemArrange(
                        arrowColor: kColorGreen,
                        iconArrange: Icons.arrow_downward,
                        textState: 'Watting: ',
                        textColor: kColorYellow,
                        numArrange: '10',
                      ),
                      ItemArrange(
                        arrowColor: kColorGreen,
                        iconArrange: Icons.arrow_downward,
                        textState: 'Delay: ',
                        textColor: kColorRed,
                        numArrange: '5',
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1.5,
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(height: 1),
                    Text(
                      'List Tasks',
                      style: GoogleFonts.saira(
                          fontSize: SizeConfig.blockSizeVertical * 3,
                          color: kTextPrimarySubColor,
                          fontWeight: FontWeight.bold),
                    ),
                    //Divider(height: 1),
                    /**
                               * ? Hiển thị todoList
                               * ? Load lai du lieu moi khi them #todo item
                               * */
                    BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
                      if (state is TodoInitial) {
                        BlocProvider.of<TodoBloc>(context).add(TodoGetEvent());
                        return InitialPage();
                      } else if (state is TodoLoading) {
                        return InitialPage();
                      } else if (state is TodoLoaded) {
                        return buildListTodo(context, state.list);
                      } else {
                        return InitialPage();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTodo(
    BuildContext context,
    List<TodoEntity> news,
  ) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ItemTodoList(task: news[index]);
      },
      itemCount: news.length,
    );
  }
}
