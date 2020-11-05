import 'package:flutter/material.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/functions.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class FloatButton extends StatefulWidget {
  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        tripEditModalBottomSheet(context);
      },
      child: Icon(
        Icons.add,
        size: SizeConfig.blockSizeVertical * 3,
        color: kPrimaryMainColor,
      ),
    );
  }


}
