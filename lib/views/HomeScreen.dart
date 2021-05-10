import 'package:Boilerplate/AppTheme.dart';
import 'package:Boilerplate/AppThemeNotifier.dart';
import 'package:Boilerplate/utils/SizeConfig.dart';
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

  @override
  void initState() {
    super.initState();
    // _loadHomeData();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<void> _refresh() async {
    // _loadHomeData();
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
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(40.0),
                    child: AppBar(
                        backgroundColor: themeData.colorScheme.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text("YourApp Name",
                        style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: 800,)
                        ),
                        
                        ),
                  ),
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
      return Container(
          child: ListView(
        children: [
          
        ],
      ));
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

  // _categoriesWidget(List<Category> categories) {
  //   List<Widget> list = [];
  //   for (Category category in categories) {
  //     list.add(InkWell(
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => CategoryProductScreen(
  //                         category: category,
  //                       )));
  //         },
  //         child: _singleCategory(category)));
  //     // list.add(SizedBox(width: MySize.size24));
  //   }
  //   // * Get only 7 category
  //   var getCategories = list.take(7);
  //   list = [];
  //   for (var category in getCategories) {
  //     list.add(category);
  //   }
  //   // * Add Show All Categories Menu
  //   list.add(InkWell(
  //       onTap: () {
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => AllCategoryScreen()));
  //       },
  //       child: _showAllCategories()));
  //   return Container(
  //     padding: Spacing.fromLTRB(8, 16, 0, 0),
  //     alignment: Alignment.center,
  //     child:
  //         // SingleChildScrollView(
  //         //   scrollDirection: Axis.horizontal,
  //         //   child: Row(
  //         Wrap(
  //       runAlignment: WrapAlignment.center,
  //       runSpacing: MySize.size26,
  //       spacing: MySize.size30,
  //       children: list,
  //       // ),
  //     ),
  //   );
  // }

  // _singleCategory(Category category) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         ClipOval(
  //           child: Container(
  //             height: MySize.size68,
  //             width: MySize.size68,
  //             color: themeData.colorScheme.primary.withAlpha(20),
  //             child: Center(
  //               child: Image.network(
  //                 category.imageUrl,
  //                 // color: themeData.colorScheme.primary,
  //                 width: MySize.getScaledSizeWidth(55),
  //                 height: MySize.getScaledSizeWidth(55),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           width: MySize.size76,
  //           padding: Spacing.top(8),
  //           child: Text(
  //             category.title,
  //             maxLines: 2,
  //             overflow: TextOverflow.clip,
  //             textAlign: TextAlign.center,
  //             style: AppTheme.getTextStyle(themeData.textTheme.caption,
  //                 fontWeight: 600, letterSpacing: 0),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
