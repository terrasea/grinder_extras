part of simple_grinder.webdev;

build({dartdevc: false, webdevApp}) {
  webdevApp = getWedevApp(webdevApp);
  var arguments = ['build'];

  if(dartdevc) {
    arguments.add('--no-release');
  }
  webdevApp.run(arguments);
}