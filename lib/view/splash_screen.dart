import 'package:flutter/material.dart';
import 'package:tech2blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech2blog/view/main_page.dart';
import 'package:tech2blog/mycolors.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    Future.delayed(Duration(seconds: 4)).then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()))
    });


    
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: Assets.images.logo.provider(), height: 66,),
              const SizedBox(height: 32,),
              const SpinKitFoldingCube(
              color: solidColor.mainColor,
              size: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}