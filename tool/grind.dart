import 'package:grinder/grinder.dart';


main(args) => grind(args);

@DefaultTask('Test.')
@Depends(format)
test() {
  PubApp.local('test').run([]);
}

@Task('Format stuff.')
@Depends(analyse)
format() {
  var output = PubApp.global('dart_style').run(['--dry-run', 'lib'], script: 'format');
  if(output.split('\n').where((line) => line.isNotEmpty).isNotEmpty) {
    context.fail('Some files are not properly formatted.');
  }
}

@Task('Analyse')
analyse() {
  Analyzer.analyze(['.']);
}