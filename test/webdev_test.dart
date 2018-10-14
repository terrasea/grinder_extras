import 'package:grinder/grinder.dart' show PubApp;
import 'package:mockito/mockito.dart';
import 'package:simple_grinder/webdev/serve.dart'
    show build, serve, activateIfInActive, getWedevApp;
import 'package:test/test.dart';

class MockPubApp extends Mock implements PubApp {}

main() {
  group('[webdev]', () {
    test('activate', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(false);
      activateIfInActive(mockPubApp);
      verify(mockPubApp.activate()).called(1);
    });

    test('serve calls run on webdevApp', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(true);
      serve(webdevApp: mockPubApp);
      verify(mockPubApp.run(['serve'])).called(1);
    });

    test(
        'serve calls run on webdevApp with --release argument when dart2js'
            ' param is set to true', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(true);
      serve(dart2js: true, webdevApp: mockPubApp);
      verify(mockPubApp.run(['serve', '--release']));
    });

    test(
        'serve calls run on webdevApp with test:8005 when testPort param is set'
            ' to 8005', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(true);
      serve(testPort: 8005, webdevApp: mockPubApp);
      verify(mockPubApp.run(['serve', 'test:8005']));
    });

    test(
        'serve calls run on webdevApp with web:8005 when webPort param is set'
            ' to 8005', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(true);
      serve(webPort: 8005, webdevApp: mockPubApp);
      verify(mockPubApp.run(['serve', 'web:8005']));
    });

    test('build calls run on webdevApp with build param', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(true);
      build(webdevApp: mockPubApp);
      verify(mockPubApp.run(['build']));
    });

    test(
        'build calls run on webdevApp with --no-release when dartdevc param'
            'set to true', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(true);
      build(dartdevc: true, webdevApp: mockPubApp);
      verify(mockPubApp.run(['build', '--no-release']));
    });

    test(
        'build calls run on webdevApp with web:b when dartdevc param'
            'set to true', () {
      var mockPubApp = new MockPubApp();
      when(mockPubApp.isActivated).thenReturn(true);
      build(dartdevc: true, webdevApp: mockPubApp);
      verify(mockPubApp.run(['build', '--no-release']));
    });
  });
}