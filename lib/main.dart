import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballer/app.dart';
import 'package:footballer/injections.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await di.init();
  runApp(const App());
}
