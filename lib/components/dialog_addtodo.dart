import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';

class DialogHelper {
  static exit(context, String timePicker) => showDialog(
      context: context, builder: (context) => DiaLogAddTodo(timePicker));
}

class DiaLogAddTodo extends StatefulWidget {
  DiaLogAddTodo(String timePicker);

  @override
  _DiaLogAddTodoState createState() => _DiaLogAddTodoState();
}

class _DiaLogAddTodoState extends State<DiaLogAddTodo> {
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
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.saira(
                        fontWeight: FontWeight.normal,
                        color: kTextPrimaryMainColor,
                        fontSize: SizeConfig.blockSizeVertical * 2.5,
                      ),
                      decoration: new InputDecoration(
                        labelText: 'Please write work content',
                        counterText: '12/150',
                        contentPadding: EdgeInsets.only(top: 10, bottom: 10),
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
                            onPressed: () {},
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.check_circle,
                              color: kPrimaryMainColor,
                            ),
                            color: kAccendMainColor,
                            label: Text(
                              'Create Todo',
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
}
