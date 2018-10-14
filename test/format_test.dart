import 'package:simple_grinder/dartfmt/format.dart' show check;
import 'package:test/test.dart';

main() {
  group('[dartfmt]', () {
    test('check returns false when formatting needed', () {
      expect(check(files:['test/test_files/incorrect_format.dart']), isFalse);
    });

    test('check returns false when formatting needed', () {
      expect(check(files:['test/test_files/correct_format.dart']), isTrue);
    });

    test('check accepts directories and is false', () {
      expect(check(directories: ['test/test_files']), isFalse);
    });
  });
}