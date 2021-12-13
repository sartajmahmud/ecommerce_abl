import 'package:grocery_app/helpers/custom_trace.dart';
import 'package:grocery_app/models/Media.dart';

class WelcomeScreen{
  int id;
  String name;
  int media_id;
  Media media;
  int order;

  WelcomeScreen();

  WelcomeScreen.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      name = jsonMap['name'] != null ? jsonMap['name'].toString() : '';
      media_id = jsonMap['media_id'] != null ? jsonMap['media_id'] : 0;
      order = jsonMap['order'] != null ? jsonMap['order'] : 1;
      media = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media']) : Media.fromJSON({});

    } catch (e) {
      id = 0;
      name = '';
      order = 0;
      media = Media();
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

}