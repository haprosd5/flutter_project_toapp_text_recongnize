import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/components/item_arrange.dart';
import 'package:projecttodoapp/components/item_todo.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
              padding: EdgeInsets.all(16),
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockSizeVertical * 25,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 0.6],
                    colors: [kAccendMainColor, Colors.cyan],
                  ),
                  /*boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 6,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],*/
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
                    'Work report',
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
                        textState: 'Success: ',
                        textColor: Colors.green[900],
                        numArrange: '12',
                      ),
                      ItemArrange(
                        arrowColor: Colors.green[900],
                        iconArrange: Icons.arrow_downward,
                        textState: 'Watting: ',
                        textColor: Colors.yellowAccent,
                        numArrange: '10',
                      ),
                      ItemArrange(
                        arrowColor: Colors.green[900],
                        iconArrange: Icons.arrow_downward,
                        textState: 'Delay: ',
                        textColor: Colors.redAccent,
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
            Divider(),
            Container(
              width: SizeConfig.screenWidth,
              margin:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'List Works',
                      style: GoogleFonts.saira(
                          fontSize: SizeConfig.blockSizeVertical * 3,
                          color: kTextPrimarySubColor,
                          fontWeight: FontWeight.bold),
                    ),
                    /**
                               * ! hien thi phan cua #todo list */
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemTodoList(
                          title: 'Todo $index',
                          description: 'Description $index',
                          icon: (index % 2 == 0)
                              ? Icons.access_alarms
                              : Icons.check_circle,
                          status: (index % 2 == 0) ? true : false,
                          time: '12:00 AM',
                        );
                      },
                      itemCount: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
