import 'package:get/get.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
    },
    'hi_IN': {
      'hello': 'नमस्ते',
    },
    'kn_IN': {
      'hello': 'ನಮಸ್ಕಾರ',
    },
    'ta_IN': {
    'hello': 'வணக்கம்',
    }
  };

}