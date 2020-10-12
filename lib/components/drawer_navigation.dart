import 'package:flutter/material.dart';
import 'package:projecttodoapp/components/title_app.dart';
import 'package:projecttodoapp/helper/size_config.dart';

import 'item_drawer.dart';
class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
                TitleApp(),
                SizedBox(
                   height: SizeConfig.blockSizeVertical * 5,
                ),
                ItemDrawer(
                   name: ' Home',
                   onPress: null,
                   icon: Icons.home,
                ),
                SizedBox(
                   height: SizeConfig.blockSizeVertical * 2,
                ),
                ItemDrawer(
                   name: ' Statistical data',
                   onPress: null,
                   icon: Icons.description,
                ),
                SizedBox(
                   height: SizeConfig.blockSizeVertical * 2,
                ),
                ItemDrawer(
                   name: ' Setting',
                   onPress: null,
                   icon: Icons.settings,
                ),
             ],
          ),
       ),
    );
  }
}
