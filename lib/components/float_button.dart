import 'package:avatar_glow/avatar_glow.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projecttodoapp/codes/sevices/speech_to_text_service.dart';
import 'package:projecttodoapp/helper/constants.dart';
import 'package:projecttodoapp/helper/size_config.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class FloatButton extends StatefulWidget {
  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  TimeOfDay _time = TimeOfDay.now();
  stt.SpeechToText _speech;
  SpeechToTextService _speechToText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
    _speechToText = SpeechToTextService();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.of(context).push(
          showPicker(
            context: context,
            value: _time,
            onChange: onTimeChanged,
            okText: 'Next',
            is24HrFormat: true,
            onChangeDateTime: (DateTime dateTime) {
              print(DateFormat.Hm().format(dateTime));
            },
          ),
        );
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AvatarGlow(
                animate: true,
                glowColor: Theme.of(context).primaryColor,
                endRadius: 75.0,
                duration: const Duration(milliseconds: 2000),
                repeatPauseDuration: const Duration(milliseconds: 100),
                repeat: true,
                child: FloatingActionButton(
                  backgroundColor: kAccendMainColor,
                  onPressed: _listen,
                  child: Icon(
                    Icons.mic,
                    color: kPrimaryMainColor,
                  ),
                ),
              );
            });
      },
      child: Icon(
        Icons.add,
        size: SizeConfig.blockSizeVertical * 3,
        color: kPrimaryMainColor,
      ),
    );
  }

  void _listen() async {
    _speechToText.getSpeechToText(_speech);
  }

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }
}
