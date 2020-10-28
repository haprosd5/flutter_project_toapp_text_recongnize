import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projecttodoapp/blocs/todo_bloc/todo_bloc.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/custom_picker.dart';
import 'package:projecttodoapp/helper/functions.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class FloatButton extends StatefulWidget {
  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  @override
  void initState() {
    // TODO: implement initState
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

  void _listen(BuildContext context, DateTime dateTime) async {
    String time = dateTime.toString();
    print(time);

    /*String title = await _speechToText.getSpeechToText(_speech);
    String time = dateTime.toString();
    // ignore: close_sinks
    final driver = BlocProvider.of<TodoBloc>(context);
    driver.add(TodoAddEvent(title: title, datetime: time));*/
  }




}
