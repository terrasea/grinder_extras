library simple_grinder.webdev;

import 'package:grinder/grinder.dart';

part 'build.dart';
part 'serve.dart';

getWedevApp(webdevApp) {
  if (webdevApp == null) {
    return PubApp.global('webdev');
  }

  return webdevApp;
}
