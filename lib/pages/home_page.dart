import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/blocs/todo_bloc/todo_bloc.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';
import 'package:projecttodoapp/components/item_arrange.dart';
import 'package:projecttodoapp/components/task.dart';
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
              height: SizeConfig.blockSizeVertical * 24,
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
                  Text(
                    'HELLO MR,HA !!',
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 3,
                      color: kPrimaryMainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Let's start a new day arrange your work ",
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      color: kPrimaryMainColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1.5,
                  ),
                  Text(
                    'Tasks report',
                    style: GoogleFonts.saira(
                      fontSize: SizeConfig.blockSizeVertical * 3,
                      color: kPrimaryMainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ItemArrange(
                        arrowColor: Colors.green[900],
                        iconArrange: Icons.arrow_upward,
                        textState: 'Suceess: ',
                        textColor: Colors.green[900],
                        numArrange: '12',
                      ),
                      ItemArrange(
                        arrowColor: Colors.green[900],
                        iconArrange: Icons.arrow_downward,
                        textState: 'Watting: ',
                        textColor: Colors.yellow[500],
                        numArrange: '10',
                      ),
                      ItemArrange(
                        arrowColor: Colors.green[900],
                        iconArrange: Icons.arrow_downward,
                        textState: 'Delay: ',
                        textColor: Colors.red,
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
                    Divider(height: 2),
                    Text(
                      'List Tasks',
                      style: GoogleFonts.saira(
                          fontSize: SizeConfig.blockSizeVertical * 3,
                          color: kTextPrimarySubColor,
                          fontWeight: FontWeight.bold),
                    ),
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
        print(news[index].title);
        return ItemTodoList(
          title: (news[index].title.runtimeType == String)
              ? news[index].title
              : 'Title todo do not setting',
          description: 'Description $index',
          icon: (index % 2 == 0) ? Icons.access_alarms : Icons.check_circle,
          status: (index % 2 == 0) ? true : false,
          time: news[index].updateAt,
        );
      },
      itemCount: news.length,
    );
  }
}
