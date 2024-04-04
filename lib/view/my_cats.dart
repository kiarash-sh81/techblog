import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech2blog/gen/assets.gen.dart';
import 'package:tech2blog/model/posterData.dart';
import 'package:tech2blog/myString.dart';
import 'package:tech2blog/my_component.dart';
import 'package:tech2blog/mycolors.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.images.techBot.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        text: myString.enterYourRegisterForm,
                        style: textTheme.headline4)),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headline5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  myString.chooseYourFavCats,
                  style: textTheme.headline4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 32, right: bodyMargin, left: bodyMargin),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: TagData.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              if(!myFav.contains(TagData[index])){
                              setState(() {
                                myFav.add(TagData[index]);
                              });
                              }

                            },
                            child: hashTagGenerator(
                                textTheme: textTheme, index: index));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.icons.arrow.path,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 16, right: bodyMargin, left: bodyMargin),
                  child: SizedBox(
                    height: 85,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: myFav.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: solidColor.surfaceColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  myFav[index].Title,
                                  style: textTheme.headline4,
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        myFav.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      size: 20,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
