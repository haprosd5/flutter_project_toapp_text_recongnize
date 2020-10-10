import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/components/item_todo.dart';
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
                margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3.0),
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
                          return ItemTodoList(
                            title: 'Todo $index',
                            description: 'Description $index',
                            icon: (index % 2 == 0)
                                ? Icons.access_alarms
                                : Icons.check_circle,
                            status: (index % 2 == 0) ? true : false,
                            time: '20/3/2020',
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
}
