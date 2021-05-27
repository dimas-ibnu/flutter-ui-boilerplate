import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:boilerplate_ui/views/loading_screens.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ThemeData
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  //Other Variables
  bool isInProgress = false;
  int _current = 0;

  List imgCategoryList = [
    './assets/images/categories/love.png',
    './assets/images/categories/double_tree.png',
    './assets/images/categories/pinus.png',
    './assets/images/categories/earth.png',
  ];

  List nameCategoryList = [
    'Galang Dana',
    'Satu  Hutan ',
    'Hutan Merdeka',
    'Rawat Bumi',
  ];

  List imgNews = [
    './assets/images/forest.png',
    './assets/images/forest.png',
    './assets/images/forest.png',
    './assets/images/forest.png',
  ];

  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadHomeData() async {
    if (mounted) {
      setState(() {
        isInProgress = true;
      });
    }

    await Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isInProgress = false;
        });
      }
    });
  }

  Future<void> _refresh() async {
    _loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: customAppTheme.bgLayer1,
                  body: RefreshIndicator(
                    onRefresh: _refresh,
                    backgroundColor: customAppTheme.bgLayer1,
                    color: themeData.colorScheme.primary,
                    key: _refreshIndicatorKey,
                    child: Column(
                      children: [
                        Container(
                          height: MySize.size3,
                          child: isInProgress
                              ? LinearProgressIndicator(
                                  minHeight: MySize.size3,
                                )
                              : Container(
                                  height: MySize.size3,
                                ),
                        ),
                        Expanded(
                          child: _buildBody(),
                        )
                      ],
                    ),
                  )),
            ));
      },
    );
  }

  _buildBody() {
    if (isInProgress) {
      return LoadingScreens.getHomeLoading(context, themeData, customAppTheme);
    } else if (!isInProgress) {
      return Container(
          padding: Spacing.only(left: 20, top: 20, right: 20),
          child: ListView(
            children: [
              _userProfile(),
              _sliderBanner(),
              _categoriesWidget(),
              _newsWidget(),
            ],
          ));
    }
  }

  _userProfile() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome",
              style: AppTheme.getTextStyle(
                themeData.textTheme.headline6,
              )),
          Text(
            "Dimas Ibnu Malik",
            style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                color: themeData.colorScheme.primary, fontWeight: 700),
          ),
        ],
      ),
      InkWell(
        onTap: () {},
        child: ClipOval(
          child: Container(
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary.withAlpha(20),
                border: Border.all(width: 1),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "./assets/images/person.jpg",
                  ),
                )),
            height: MySize.size54,
            width: MySize.size54,
          ),
        ),
      )
    ]);
  }

  _sliderBanner() {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: [1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: Spacing.only(top: 10),
                    child: Image(
                      image: AssetImage('./assets/images/banner.png'),
                    ),
                  );
                },
              );
            }).toList()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4].map((i) {
            int index = [1, 2, 3, 4].indexOf(i);
            return Container(
              width: MySize.size8,
              height: MySize.size8,
              margin: Spacing.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? themeData.colorScheme.secondaryVariant
                    : Colors.grey[400],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  _categoriesWidget() {
    List<Widget> list = [];
    for (int i = 0; i <= 3; i++) {
      list.add(InkWell(onTap: () {}, child: _singleCategory(i)));
      // list.add(SizedBox(width: MySize.size24));
    }

    // * Add Show All Categories Menu
    return Container(
      padding: Spacing.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list,
      ),
    );
  }

  _singleCategory(int index) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MySize.getScaledSizeWidth(55),
            height: MySize.getScaledSizeWidth(55),
            decoration: BoxDecoration(
              color: themeData.colorScheme.primary.withAlpha(20),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imgCategoryList[index],
              fit: BoxFit.cover,
            ),
            padding: Spacing.all(15),
          ),
          Container(
            width: MySize.size76,
            padding: Spacing.top(8),
            child: Text(
              nameCategoryList[index],
              maxLines: 2,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600, letterSpacing: 0),
            ),
          )
        ],
      ),
    );
  }

  _newsWidget() {
    List<Widget> newsList = [];
    for (int i = 0; i <= 3; i++) {
      newsList.add(InkWell(onTap: () {}, child: _singleNews(i)));
    }

    return Container(
      padding: Spacing.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Browser",
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight: 700, color: themeData.colorScheme.secondary)),
              InkWell(
                  onTap: () {},
                  child: Text("Lihat semua",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight: 700,
                          color: themeData.colorScheme.primary))),
            ],
          ),
          Column(children: newsList)
        ],
      ),
    );
  }

  _singleNews(int index) {
    return Stack(children: [
      Container(
        height: MySize.getScaledSizeHeight(150),
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(imgNews[index]))),
        margin: Spacing.symmetric(vertical: 10),
      ),
      Positioned(
          bottom: 20.0,
          left: 10.0,
          child: SizedBox(
              width: MySize.getScaledSizeWidth(200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("100 Trees from Lucy to Indonesia",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight: 700,
                          color: themeData.colorScheme.onPrimary)),
                  Text("100 pohon untuk indonesia",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight: 500,
                          color: themeData.colorScheme.onPrimary)),
                ],
              ))),
      Positioned(
          top: 20.0,
          right: 10.0,
          child: SizedBox(
              width: MySize.getScaledSizeWidth(150),
              child: Text("#SAVEARTH",
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontWeight: 800,
                      color: themeData.colorScheme.onPrimary)))),
      Positioned(
        bottom: 20.0,
        right: 10.0,
        child: ClipOval(
          child: Container(
            width: MySize.getScaledSizeWidth(30),
            height: MySize.getScaledSizeWidth(30),
            color: themeData.colorScheme.onPrimary,
            child: Image.asset(
              imgCategoryList[index],
              fit: BoxFit.cover,
            ),
            padding: Spacing.all(8),
          ),
        ),
      ),
    ]);
  }

  // showMessage({String message = "Something wrong", Duration duration}) {
  //   if (duration == null) {
  //     duration = Duration(seconds: 3);
  //   }
  //   _scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //       duration: duration,
  //       content: Text(message,
  //           style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
  //               letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
  //       backgroundColor: themeData.colorScheme.primary,
  //       behavior: SnackBarBehavior.fixed,
  //     ),
  //   );
  // }
}
