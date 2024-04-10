import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:janadem/screens/splash_screen.dart';
import 'package:oktoast/oktoast.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return OKToast(
      child: GetMaterialApp(
        title: 'JanaDem',
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU')
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:
        const SplashScreen(),
      ),
    );
  }
}