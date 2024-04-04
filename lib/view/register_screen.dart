// import 'dart:ffi';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech2blog/gen/assets.gen.dart';
import 'package:tech2blog/myString.dart';
import 'package:tech2blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techBot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: myString.wellcome, style: textTheme.headline4)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailButomSheet(context, size, textTheme);
                  },
                  child: Text(
                    "بزن بریم",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailButomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
                  
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (context) {
                      return Padding(
                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height/2,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(32) , topRight: Radius.circular(32))
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(myString.insertYourEmail, style: textTheme.headline4,),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(24,24,24,0),
                                  child: TextField(
                                    onChanged: (value) {
                                      isEmail(value);
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "techblog@gmail.com",
                                      hintStyle: textTheme.headline5,
                                    ),
                                  ),
                                ),
                                ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                  _showCodeButomSheet(context, size, textTheme);
                                }, child: Text("ادامه" , style: TextStyle(color: Colors.white),))
                              ],
                            ),
                          ),
                        ),
                      );
                  });
  }
Future<dynamic> _showCodeButomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
                  
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (context) {
                      return Padding(
                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height/2,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(32) , topRight: Radius.circular(32))
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(myString.insertYourVarifyCode, style: textTheme.headline4,),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(24,24,24,0),
                                  child: TextField(
                                    onChanged: (value) {
                                      isEmail(value);
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "******",
                                      hintStyle: textTheme.headline5,
                                    ),
                                  ),
                                ),
                                ElevatedButton(onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyCats(),));
                                }, child: Text("ادامه" , style: TextStyle(color: Colors.white),))
                              ],
                            ),
                          ),
                        ),
                      );
                  });
  }


}
