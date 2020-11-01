import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/blocs/todo_bloc/todo_bloc.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class DialogHelper {
  static exit(context, String timePicker) => showDialog(
      context: context, builder: (context) => DiaLogAddTodo(timePicker));
}

class DiaLogAddTodo extends StatefulWidget {
  final String timePicker;

  DiaLogAddTodo(this.timePicker);

  @override
  _DiaLogAddTodoState createState() => _DiaLogAddTodoState(this.timePicker);
}

class _DiaLogAddTodoState extends State<DiaLogAddTodo> {
  String time;
  final _controller = TextEditingController();

  _DiaLogAddTodoState(this.time);

  void onValueChange() {
    setState(() {
      _controller.text;
    });
  }
  @override
  void initState() {
    super.initState();
    _controller.addListener(onValueChange);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      elevation: 1,
      backgroundColor: kPrimaryMainColor,
      child: Container(
        height: SizeConfig.blockSizeVertical * 25,
        child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 3.0),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 2),
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      maxLength: 200,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.saira(
                        fontWeight: FontWeight.normal,
                        color: kTextPrimaryMainColor,
                        fontSize: SizeConfig.blockSizeVertical * 2.5,
                      ),
                      controller: _controller,
                      decoration: new InputDecoration(
                        labelText: 'Please write work content',
                        counterText: '${200 - _controller.text.length}/200',
                        contentPadding: EdgeInsets.only(bottom: 10),
                        counterStyle: GoogleFonts.saira(
                          fontWeight: FontWeight.normal,
                          color: kTextPrimarySubColor,
                          fontSize: SizeConfig.blockSizeVertical * 1.5,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kAccendSubColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kAccendMainColor)),
                        labelStyle: GoogleFonts.saira(
                          fontWeight: FontWeight.normal,
                          color: kAccendMainColor,
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(1);
                            },
                            color: kPrimaryMainColor,
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.saira(
                                fontWeight: FontWeight.normal,
                                color: Colors.red,
                                fontSize: SizeConfig.blockSizeVertical * 2,
                              ),
                            )),
                        RaisedButton.icon(
                            onPressed: () {
                              _listen(context, time, _controller.text);

                              Navigator.of(context).pop(1);
                            },
                            icon: Icon(
                              Icons.check_circle,
                              color: kPrimaryMainColor,
                            ),
                            color: kAccendMainColor,
                            label: Text(
                              'Create Task',
                              style: GoogleFonts.saira(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryMainColor,
                                fontSize: SizeConfig.blockSizeVertical * 2,
                              ),
                            )),
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  /**
   * ! xứ lý sư kiện thêm task
   * */
  void _listen(BuildContext context, String taskTime, String taskName) {
    // ignore: close_sinks
    final driver = BlocProvider.of<TodoBloc>(context);
    driver.add(TodoAddEvent(title: taskName, datetime: taskTime));
  }
}
