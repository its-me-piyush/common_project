import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:events_app/screens/Login_screen.dart';
import './provider/event_provider.dart';

//Following is the main method, to execute
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

//Following is the class My App, to start our app and set the defaults

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: EventsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Events',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(resizeToAvoidBottomInset: false, body: LoginScreen()),
      ),
    );
  }
}
