



import 'package:avatar_glow/avatar_glow.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<Widget> functionFloatButton(BuildContext context, bool _isListening, VoidCallback listen) async {
   return await AvatarGlow(
      animate: _isListening,
      glowColor: Theme.of(context).primaryColor,
      endRadius: 75.0,
      duration: const Duration(milliseconds: 2000),
      repeatPauseDuration: const Duration(milliseconds: 100),
      repeat: true,
      child: FloatingActionButton(
         onPressed: listen,
         child: Icon(_isListening ? Icons.mic : Icons.mic_none),
      ),
   );
}