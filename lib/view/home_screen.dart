import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech2blog/gen/assets.gen.dart';
import 'package:tech2blog/model/posterData.dart';
import 'package:tech2blog/myString.dart';
import 'package:tech2blog/my_component.dart';
import 'package:tech2blog/mycolors.dart';

class mainPageScreen extends StatelessWidget {
  const mainPageScreen({
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
        children: [
          SizedBox(
            height: 16,
          ),
          
          HomePageBanner(size: size, textTheme: textTheme),
          
          SizedBox(
            height: 46,
          ),
          
          HahtagList(marginHashtag: marginHashtag, textTheme: textTheme),
          
          SizedBox(
            height: 32,
          ),
          
          HotestBlogTitle(marginHashtag: marginHashtag, textTheme: textTheme),
          
          BlogList(size: size, marginHashtag: marginHashtag, textTheme: textTheme),
          
          HotestPodcastTitle(marginHashtag: marginHashtag, textTheme: textTheme),
          
          PodcastList(size: size, marginHashtag: marginHashtag, textTheme: textTheme),
          
          SizedBox(height: 24,)
        ],
      ),
    );
  }
}

class PodcastList extends StatelessWidget {
  const PodcastList({
    super.key,
    required this.size,
    required this.marginHashtag,
    required this.textTheme,
  });

  final Size size;
  final double marginHashtag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(6, 11).length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? marginHashtag : 15),
            child: Column(
              children: [
                SizedBox(
                  width: size.width / 2.4,
                  height: size.height / 5.0,
                  child: Stack(children: [
                    Container(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index + 3].imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ]),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index + 3].title,
                    style: textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        
        },
      ),
    );
  }
}

class HotestPodcastTitle extends StatelessWidget {
  const HotestPodcastTitle({
    super.key,
    required this.marginHashtag,
    required this.textTheme,
  });

  final double marginHashtag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, marginHashtag, 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.mice.provider(),
            color: solidColor.seeMore,
            size: 24,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            myString.viewHotPodCast,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  const BlogList({
    super.key,
    required this.size,
    required this.marginHashtag,
    required this.textTheme,
  });

  final Size size;
  final double marginHashtag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? marginHashtag : 15),
            child: Column(
              children: [
                SizedBox(
                  width: size.width / 2.4,
                  height: size.height / 5.0,
                  child: Stack(children: [
                    Container(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index].imageUrl),
                              fit: BoxFit.cover)),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(16)),
                        gradient: LinearGradient(
                            colors: gradiantColor.blackToWhite,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            blogList[index].writer,
                            style: textTheme.headline2,
                          ),
                          Row(
                            children: [
                              Text(
                                blogList[index].views,
                                style: textTheme.headline2,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                CupertinoIcons.eye,
                                color: Colors.white,
                                size: 16,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    style: textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class HotestBlogTitle extends StatelessWidget {
  const HotestBlogTitle({
    super.key,
    required this.marginHashtag,
    required this.textTheme,
  });

  final double marginHashtag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, marginHashtag, 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen.provider(),
            color: solidColor.seeMore,
            size: 24,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            myString.viewHotBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HahtagList extends StatelessWidget {
  const HahtagList({
    super.key,
    required this.marginHashtag,
    required this.textTheme,
  });

  final double marginHashtag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: TagData.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(
                  8, 10, index == 0 ? marginHashtag : 8, 8),
              child: hashTagGenerator(textTheme: textTheme , index: index));
        },
      ),
    );
  }
}


class HomePageBanner extends StatelessWidget {
  const HomePageBanner({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 4.2,
          width: size.width / 1.25,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(HomePageData["imageAsset"]),
                fit: BoxFit.cover),
            borderRadius:
                const BorderRadius.all(Radius.circular(16)),
          ),
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: gradiantColor.HomeBannerGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      HomePageData["write"] +
                          " - " +
                          HomePageData["date"],
                      style: textTheme.subtitle1,
                    ),
                    Row(
                      children: [
                        Text(HomePageData["view"],
                            style: textTheme.subtitle1),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          CupertinoIcons.eye,
                          color: Colors.white,
                          size: 16,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(HomePageData["title"],
                    style: textTheme.headline1),
              ],
            ))
      ],
    );
  }
}
