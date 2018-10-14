library simple_grinder.dartfmt;

import 'package:grinder/grinder.dart' show PubApp;

getFormatApp(formatApp) {
  if (formatApp != null) {
    return formatApp;
  }

  return PubApp.global('dart_style');
}

bool check({directories, files, formatApp}) {
  List<String> tests = new List()
    ..addAll(directories != null ? directories : [])
    ..addAll(files != null ? files : []);
  var arguments = ['--dry-run']..addAll(tests);

  final String output =
      getFormatApp(formatApp).run(arguments, script: 'format');
  if (output.split('\n').where((line) => line.isNotEmpty).isNotEmpty) {
    return false;
  }

  return true;
}
