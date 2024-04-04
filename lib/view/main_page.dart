
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech2blog/gen/assets.gen.dart';
import 'package:tech2blog/model/posterData.dart';
import 'package:tech2blog/mycolors.dart';
import 'package:tech2blog/view/home_screen.dart';
import 'package:tech2blog/view/profile_screen.dart';

class MainPage extends StatefulWidget {

  var selectedPageIndex = 0;
  

  @override
  State<MainPage> createState() => _MainPageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();
class _MainPageState extends State<MainPage> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double marginHashtag = size.width / 10;
    List<Widget> homePageScreens = [
      mainPageScreen(size: size, textTheme: textTheme, marginHashtag: marginHashtag),
      ProfilePageScreen(size: size, textTheme: textTheme, marginHashtag: marginHashtag)
      ];
    print(blogList[0].imageUrl);
    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: Drawer(
            backgroundColor: solidColor.scafoldBg,
            child: Padding(
              padding:  EdgeInsets.only(left: marginHashtag , right: marginHashtag),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Center(child: Image.asset(Assets.images.logo.path , scale: 3,),) 
                    ),
                    ListTile(
                      title: Text("پروفایل کاربری" , style: textTheme.headline4,),
                      onTap: () {
                        
                      },
                    ),
                    const Divider(
                      color: solidColor.dividerColor,
                      
                    ),
                    ListTile(
                      title: Text("درباره تک‌بلاگ" , style: textTheme.headline4,),
                      onTap: () {
                        
                      },
                    ),
                    const Divider(
                      color: solidColor.dividerColor,
                      
                    ),
                    ListTile(
                      title: Text("اشتراک گذاری تک بلاگ" , style: textTheme.headline4,),
                      onTap: () {
                        
                      },
                    ),
                    const Divider(
                      color: solidColor.dividerColor,
                      
                    ),
                    ListTile(
                      title: Text("تک‌بلاگ در گیت هاب" , style: textTheme.headline4,),
                      onTap: () {
                        
                      },
                    ),
                    
                ],
              ),
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: solidColor.scafoldBg,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Icon(Icons.menu)
                    ),
                  Image(
                    image: Assets.images.logo.provider(),
                    height: size.height / 13.6,
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              Center(
                child: Positioned.fill(
                  child: IndexedStack(index: selectedPageIndex,
                  children: [
                    mainPageScreen(size: size, textTheme: textTheme, marginHashtag: marginHashtag),
                    ProfilePageScreen(size: size, textTheme: textTheme, marginHashtag: marginHashtag)
                  ],))
              ),
              NavigationBar(
                size: size, 
                marginHashtag: marginHashtag,
                changePage: (int pageNumber) {
                  setState(() {
                    selectedPageIndex = pageNumber;
                  });
                },
                ),
            ],
          )

          // bottomNavigationBar:
          ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    super.key,
    required this.size,
    required this.marginHashtag,
    required this.changePage,
  });

  final Size size;
  final double marginHashtag;
  final Function (int) changePage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradiantColor.navBar,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: 1.3 * marginHashtag, right: 1.3 * marginHashtag),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient:
                    LinearGradient(colors: gradiantColor.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changePage(0),
                  icon: ImageIcon(
                    Assets.icons.home.provider(),
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(Assets.icons.write.provider(),
                      color: Colors.white, size: 28),
                ),
                IconButton(
                  onPressed: () => changePage(1),
                  icon: ImageIcon(
                    Assets.icons.user.provider(),
                    color: Colors.white,
                    size: 28,
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

