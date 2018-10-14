library simple_grinder.pub;

import 'package:grinder/grinder.dart';

activateIfInActive(webdevApp) {
  if(!webdevApp.isActivated) {
    webdevApp.activate();
  }
}

getWedevApp(webdevApp) {
  if(webdevApp == null) {
    return PubApp.global('webdev');
  }

  return webdevApp;
}

serve({dart2js: false, testPort, webPort, webdevApp}) {
  webdevApp = getWedevApp(webdevApp);
  activateIfInActive(webdevApp);
  var arguments = ['serve'];
  if(dart2js) {
    arguments.add('--release');
  }

  if(testPort != null) {
    arguments.add('test:$testPort');
  }

  if(webPort != null) {
    arguments.add('web:$webPort');
  }

  webdevApp.run(arguments);
}

build({dartdevc: false, webdevApp}) {
  webdevApp = getWedevApp(webdevApp);
  activateIfInActive(webdevApp);
  var arguments = ['build'];
  
  if(dartdevc) {
    arguments.add('--no-release');
  }
  webdevApp.run(arguments);
}