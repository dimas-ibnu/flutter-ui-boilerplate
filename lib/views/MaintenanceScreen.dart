import 'package:Boilerplate/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

//----------------------------- Maintenance Screen -------------------------------//

class MaintenanceScreen extends StatefulWidget {
  final bool isNeedUpdate;

  const MaintenanceScreen({Key key, this.isNeedUpdate = false})
      : super(key: key);

  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  //ThemeData
  ThemeData themeData;
  bool isInProgress = false;

  //Variables
  bool isNeedUpdate;

  @override
  void initState() {
    super.initState();
    isNeedUpdate = widget.isNeedUpdate;
  }

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: themeData.backgroundColor,
                  body: Container(
                    child: Column(
                      children: <Widget>[
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
                        Container(
                          child: Image(
                            image:
                                AssetImage('./assets/images/maintenance.png'),
                          ),
                        ),
                        !isNeedUpdate
                            ? Column(
                                children: [
                                  Container(
                                    margin: Spacing.top(24),
                                    child: Text(
                                     "We got some errors",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0.2),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.fromLTRB(24, 24, 24, 0),
                                    child: Text(
                                      "If you found bugs then uninstall app and re install application or contact to admin",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                      margin: Spacing.only(
                                          left: MySize.size56,
                                          right: MySize.size56,
                                          top: MySize.size24),
                                      child: FlatButton(
                                        onPressed: () {
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size4)),
                                        color: themeData.colorScheme.primary,
                                        child: Text(
                                          "Refresh",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                        ),
                                      ))
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    margin: Spacing.top(24),
                                    child: Text(
                                     "please update the apps",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0.2),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.fromLTRB(24, 24, 24, 0),
                                    child: Text(
                                      "Please download our latest version and enjoy",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                      margin: Spacing.only(
                                          left: MySize.size56,
                                          right: MySize.size56,
                                          top: MySize.size24),
                                      child: FlatButton(
                                        onPressed: () {
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size4)),
                                        color: themeData.colorScheme.primary,
                                        child: Text(
                                         "Download",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                        ),
                                      ))
                                ],
                              )
                      ],
                    ),
                  )),
            ));
      },
    );
  }

  void showMessage({String message = "Something wrong", Duration duration}) {
    if (duration == null) {
      duration = Duration(seconds: 3);
    }
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(message,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
