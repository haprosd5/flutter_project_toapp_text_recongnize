import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  String textToSpeech;

  Future<String> getSpeechToText(stt.SpeechToText _speech) async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      _speech.listen(onResult: (val) => {textToSpeech = val.recognizedWords});
      return textToSpeech;
    } else {
      _speech.stop();
      return '';
    }
  }

}
