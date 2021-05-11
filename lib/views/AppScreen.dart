import 'package:Boilerplate/AppTheme.dart';
import 'package:Boilerplate/AppThemeNotifier.dart';
import 'package:Boilerplate/utils/SizeConfig.dart';
import 'package:Boilerplate/views/HomeScreen.dart';
import 'package:Boilerplate/views/auth/RegisterScreen.dart';
import 'package:Boilerplate/views/auth/LoginScreen.dart';
import 'package:Boilerplate/views/MaintenanceScreen.dart';
import 'package:Boilerplate/views/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class AppScreen extends StatefulWidget {
  final int selectedPage;

  const AppScreen({Key key, this.selectedPage = 0}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  dispose() {
    super.dispose();
    _tabController.dispose();
  }

  ThemeData themeData;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeMode = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeMode);
        customAppTheme = AppTheme.getCustomAppTheme(themeMode);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
            backgroundColor: customAppTheme.bgLayer1,
            bottomNavigationBar: BottomAppBar(
                elevation: 0,
                shape: CircularNotchedRectangle(),
                child: Container(
                  decoration: BoxDecoration(
                    color: customAppTheme.bgLayer1,
                    boxShadow: [
                      BoxShadow(
                        color: themeData.cardTheme.shadowColor.withAlpha(40),
                        blurRadius: 3,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  padding: Spacing.only(top: 12, bottom: 12),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: themeData.colorScheme.primary,
                    tabs: <Widget>[
                      Container(
                        child: (_currentIndex == 0)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.viewDashboard,
                                    color: themeData.colorScheme.primary,
                                  ),
                                  Container(
                                    
                                    margin: Spacing.top(4),
                                    decoration: BoxDecoration(
                                        color: themeData.primaryColor,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 15,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.viewDashboardOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                      ),
                      Container(
                          child: (_currentIndex == 1)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.account,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: Spacing.top(4),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 15,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.accountOutline,
                                  color: themeData.colorScheme.onBackground,
                                )),
                      Container(
                          child: (_currentIndex == 2)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.accountPlus,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: Spacing.top(4),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 15,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.accountPlusOutline,
                                  color: themeData.colorScheme.onBackground,
                                )),
                      Container(
                          child: (_currentIndex == 3)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.noteRemove,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: Spacing.top(4),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 15,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.noteRemoveOutline,
                                  color: themeData.colorScheme.onBackground,
                                )),
                      Container(
                          child: (_currentIndex == 4)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.details,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: Spacing.top(4),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 15,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.details,
                                  color: themeData.colorScheme.onBackground,
                                )),
                    ],
                  ),
                )),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                HomeScreen(),
                LoginScreen(),
                RegisterScreen(),
                MaintenanceScreen(),
                DetailScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
