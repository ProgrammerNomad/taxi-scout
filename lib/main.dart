import 'package:flutter/material.dart';
import 'package:tagyourtaxi_driver/functions/functions.dart';
import 'package:tagyourtaxi_driver/functions/notifications.dart';
import 'pages/loadingPage/loadingpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  checkInternetConnection();

  initMessaging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TexiScout24',
            theme: ThemeData(),
            home: LoadingPage()));
  }
}