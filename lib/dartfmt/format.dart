library simple_grinder.dartfmt;

import 'package:grinder/grinder.dart' show PubApp;

bool check({directories, files}) {
  List<String> tests = new List()
    ..addAll(directories != null ? directories : [])
    ..addAll(files != null ? files : []);
  final String output = PubApp.global('dart_style')
      .run(['--dry-run']..addAll(tests), script: 'format');
  if (output.split('\n').where((line) => line.isNotEmpty).isNotEmpty) {
    return false;
  }

  return true;
}
