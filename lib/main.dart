import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech2blog/mycolors.dart';
import 'package:tech2blog/view/register_screen.dart';
import 'package:tech2blog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: solidColor.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: solidColor.systemNavigator,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

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
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 2)
            ),
            filled: true,
            fillColor: Colors.white
          ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: solidColor.primaryColor))),
                  textStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const TextStyle(
                          fontFamily: "dana",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white);
                    }
                    return const TextStyle(
                        fontFamily: "dana",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: solidColor.subTitleTextBanner);
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return solidColor.seeMore;
                    }
                    return solidColor.primaryColor;
                  })),
            ),
            fontFamily: "dana",
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: "dana",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: solidColor.headTextBanner),
              subtitle1: TextStyle(
                  fontFamily: "dana",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: solidColor.subTitleTextBanner),
              headline2: TextStyle(
                  fontFamily: "dana",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              headline3: TextStyle(
                  fontFamily: "dana",
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: solidColor.seeMore),
              headline4: TextStyle(
                  fontFamily: "dana",
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              headline5: TextStyle(
                  fontFamily: "dana",
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: solidColor.hintTextColor),
              bodyText1: TextStyle(
                fontFamily: "dana",
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            )),
        debugShowCheckedModeBanner: false,
        // home: SplashScreen());
        home: RegisterScreen());
  }
}
