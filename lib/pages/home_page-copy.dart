import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
