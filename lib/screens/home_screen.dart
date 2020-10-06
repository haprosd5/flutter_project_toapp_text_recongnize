import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarController calendarController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarController = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'TODO ',
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
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: SizeConfig.blockSizeVertical * 3,
                ),
                onPressed: null)
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarController: calendarController,
                calendarStyle: CalendarStyle(
                  selectedStyle: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 2,
                    color: kPrimaryMainColor,
                  ),
                  outsideStyle: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 2,
                  ),
                  weekendStyle: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 2,
                    color: Colors.red,
                  ),
                  weekdayStyle: TextStyle(
                    color: kTextPrimaryMainColor,
                    fontSize: SizeConfig.blockSizeVertical * 2,
                    fontWeight: FontWeight.bold,
                  ),
                  selectedColor: kAccendMainColor,
                  todayColor: kTextPrimarySubColor,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      color: Color(0xff30384c),
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2),
                  weekendStyle: TextStyle(
                      color: Color(0xff30384c),
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeVertical * 2),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: Color(0xff30384c),
                    fontSize: SizeConfig.blockSizeVertical * 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    size: SizeConfig.blockSizeVertical * 3,
                    color: Color(0xff30384c),
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    size: SizeConfig.blockSizeVertical * 3,
                    color: Color(0xff30384c),
                  ),
                ),
                locale: 'en_US',
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1.5,
              ),
              Divider(),
              Container(
                width: SizeConfig.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'List Todo',
                        style: GoogleFonts.saira(
                            fontSize: SizeConfig.blockSizeVertical * 3,
                            color: kTextPrimarySubColor,
                            fontWeight: FontWeight.bold),
                      ),
                      // hien thi phan todo
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return buildTodo(context, 'Todo one', 'Des todo one');
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
      ),
      floatingActionButton: AvatarGlow(
        animate: false,
        glowColor: Theme.of(context).primaryColor,
        endRadius: SizeConfig.blockSizeVertical * 3.5,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(
            Icons.mic_off,
            size: SizeConfig.blockSizeVertical * 2.5,
            color: kPrimaryMainColor,
          ), // ! false ? Icons.mic :
        ),
      ),
    );
  }

  Container buildTodo(BuildContext context, String title, String description) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeHorizontal * 1.5, bottom: SizeConfig.blockSizeHorizontal * 1.5),
      child: Container(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Icon(
                Icons.check_circle,
                color: kAccendMainColor,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              fontWeight: FontWeight.bold,
                              color: kTextPrimaryMainColor),
                        ),
                        Text(
                          'today',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 1.5,
                              fontStyle: FontStyle.italic,
                              color: kTextPrimarySubColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 1,
                    ),
                    Text(
                      description,
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
