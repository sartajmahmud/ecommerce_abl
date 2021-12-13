
import 'package:grocery_app/models/WelcomeScreen.dart';
import 'package:grocery_app/repositories/WelcomeScreenRepository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class WelcomeScreenController extends ControllerMVC{
  WelcomeScreen welcomescreen = new WelcomeScreen();
  List welcomeScreens = [];

  getWelcomeScreen() async {
    final Stream<WelcomeScreen> stream = await getWelcome();
    stream.listen((WelcomeScreen _slide) {
      print("Media url "+_slide.media.url);
      setState(() => welcomeScreens.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}