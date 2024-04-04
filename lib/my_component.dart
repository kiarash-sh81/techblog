import 'package:flutter/material.dart';
import 'package:tech2blog/gen/assets.gen.dart';
import 'package:tech2blog/model/posterData.dart';
import 'package:tech2blog/mycolors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: solidColor.dividerColor,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}

class hashTagGenerator extends StatelessWidget {
  const hashTagGenerator({
    super.key,
    required this.textTheme,
    required this.index
  });

  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
            colors: gradiantColor.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: Colors.white,
              size: 16,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              TagData[index].Title,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}
class hashTagFavGenerator extends StatelessWidget {
  const hashTagFavGenerator({
    super.key,
    required this.textTheme,
    required this.index
  });

  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
            colors: gradiantColor.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: Colors.white,
              size: 16,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              myFav[index].Title,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}
