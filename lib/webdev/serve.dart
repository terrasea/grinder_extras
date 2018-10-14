part of simple_grinder.webdev;

serve({dart2js = false, testPort, webPort, webdevApp}) {
  webdevApp = getWedevApp(webdevApp);
  var arguments = ['serve'];
  if (dart2js) {
    arguments.add('--release');
  }

  if (testPort != null) {
    arguments.add('test:$testPort');
  }

  if (webPort != null) {
    arguments.add('web:$webPort');
  }

  webdevApp.run(arguments);
}
