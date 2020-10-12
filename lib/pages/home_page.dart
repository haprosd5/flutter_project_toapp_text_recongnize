import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/components/item_todo.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    //SizeConfig().init(context);
    return Container(
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
