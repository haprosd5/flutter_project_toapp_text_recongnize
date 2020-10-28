import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projecttodoapp/components/drawer_navigation.dart';
import 'package:projecttodoapp/components/float_button.dart';
import 'package:projecttodoapp/components/title_app.dart';
import 'package:projecttodoapp/helper/size_config.dart';
import 'package:projecttodoapp/pages/home_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: TitleApp(),
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
      drawer: DrawerNavigation(),
      body: HomePage(),
      floatingActionButton: FloatButton(),
    );
  }
}
