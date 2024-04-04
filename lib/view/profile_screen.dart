import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech2blog/gen/assets.gen.dart';
import 'package:tech2blog/myString.dart';
import 'package:tech2blog/my_component.dart';
import 'package:tech2blog/mycolors.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.marginHashtag,
  });

  final Size size;
  final TextTheme textTheme;
  final double marginHashtag;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image:  Assets.images.profileAvatar.provider() , height: 100,),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(Assets.icons.bluePen.provider() , color: solidColor.seeMore, size: 20,),
              SizedBox(width: 8,),
              Text(myString.editProfileImage , style: textTheme.headline3,)
            ],
          ),
          SizedBox(height: 60,),
          Text("کیارش ملاغلام شاهرودی" , style: textTheme.headline4,),
          SizedBox(height: 16,),
          Text("kiarashshahroudi@gmail.com" , style: textTheme.headline4,),
          SizedBox(height: 40,),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              
            },
            splashColor: solidColor.primaryColor,
            child: SizedBox(
            height: 45,
            child: Center(child: Text(myString.myFavBlog , style: textTheme.headline4,))
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              
            },
            splashColor: solidColor.primaryColor,
            child: SizedBox(
            height: 45,
            child: Center(child: Text(myString.myFavPodcast , style: textTheme.headline4,))
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              
            },
            splashColor: solidColor.primaryColor,
            child: SizedBox(
            height: 45,
            child: Center(child: Text(myString.logout , style: textTheme.headline4,))
            ),
          ),

          SizedBox(height: 60,)
 
        ],
      )
    );
  }
}



