import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech2blog/gen/assets.gen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(Assets.images.logo);

    return MaterialApp(
      
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "dana",
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "dana",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            fontFamily: "dana",
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          headline3: TextStyle(
            fontFamily: "dana",
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            fontFamily: "dana",
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            fontFamily: "dana",
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ), 
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Image(image: Assets.images.logo.provider())),),
    );
  }
}

