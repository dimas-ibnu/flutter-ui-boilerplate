import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/app_theme_notifier.dart';
import 'package:boilerplate_ui/utils/size_config.dart';
import 'package:boilerplate_ui/utils/validator.dart';
import 'package:boilerplate_ui/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Theme Data
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  //Text Field Editing Controller
  TextEditingController nameTFController;
  TextEditingController emailTFController;
  TextEditingController passwordTFController;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Other Variables
  bool showPassword = false;
  bool isInProgress = false;

  //UI Variables
  OutlineInputBorder allTFBorder;

  @override
  void initState() {
    super.initState();
    nameTFController = TextEditingController();
    emailTFController = TextEditingController();
    passwordTFController = TextEditingController();
  }

  @override
  void dispose() {
    nameTFController.dispose();
    emailTFController.dispose();
    passwordTFController.dispose();
    super.dispose();
  }

  _initUI() {
    allTFBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(color: customAppTheme.bgLayer4, width: 1.5));
  }

  _handleRegister() async {
    String username = nameTFController.text;
    String email = emailTFController.text;
    String password = passwordTFController.text;

    if (username.isEmpty) {
      showMessage(message: "Please Fill Username");
    } else if (email.isEmpty) {
      showMessage(message: "Please Fill Email");
    } else if (Validator.isEmail(email)) {
      showMessage(message: "Please fill email properly");
    } else if (password.isEmpty) {
      showMessage(message: "Please fill password");
    } else {
      setState(() {
        isInProgress = true;
      });

      await Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        _initUI();
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: Spacing.top(150),
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            './assets/images/logo.png',
                            color: themeData.colorScheme.primary,
                            width: 54,
                            height: 54,
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: Spacing.top(24),
                            child: Text(
                              "Create New Account".toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700,
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 24, 24, 0),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: allTFBorder,
                                enabledBorder: allTFBorder,
                                focusedBorder: allTFBorder,
                                prefixIcon: Icon(
                                  MdiIcons.accountOutline,
                                  size: MySize.size22,
                                ),
                                isDense: true,
                                contentPadding: Spacing.zero),
                            keyboardType: TextInputType.text,
                            controller: nameTFController,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                                hintText: "Email Address",
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: allTFBorder,
                                enabledBorder: allTFBorder,
                                focusedBorder: allTFBorder,
                                prefixIcon: Icon(
                                  MdiIcons.emailOutline,
                                  size: MySize.size22,
                                ),
                                isDense: true,
                                contentPadding: Spacing.zero),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailTFController,
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: TextFormField(
                            obscureText: showPassword,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              hintText: "Password",
                              border: allTFBorder,
                              enabledBorder: allTFBorder,
                              focusedBorder: allTFBorder,
                              prefixIcon: Icon(
                                MdiIcons.lockOutline,
                                size: 22,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Icon(
                                  showPassword
                                      ? MdiIcons.eyeOutline
                                      : MdiIcons.eyeOffOutline,
                                  size: MySize.size22,
                                ),
                              ),
                              isDense: true,
                              contentPadding: Spacing.zero,
                            ),
                            controller: passwordTFController,
                          ),
                        ),
                        Container(
                            margin: Spacing.fromLTRB(24, 24, 24, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size48)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(100),
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                // shape: RoundedRectangleBorder(
                                //     borderRadius:
                                //         BorderRadius.circular(MySize.size8)),
                                // color: themeData.colorScheme.primary,
                                // highlightColor: themeData.colorScheme.primary,
                                // splashColor: Colors.white.withAlpha(100),
                                // padding: Spacing.only(top: 16, bottom: 16),
                                onPressed: _handleRegister,
                                child: Stack(
                                  // overflow: Overflow.visible,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.center,
                                        child: !isInProgress
                                            ? Text(
                                                "Create".toUpperCase(),
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    color: themeData
                                                        .colorScheme.onPrimary,
                                                    letterSpacing: 0.8,
                                                    fontWeight: 700),
                                              )
                                            : Container(
                                                width: MySize.size20,
                                                height: MySize.size20,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          themeData.colorScheme
                                                              .onPrimary),
                                                ),
                                              )),

                                    // Positioned(
                                    //   right: 16,
                                    //   child: isInProgress
                                    //       ? Container(
                                    //           width: MySize.size16,
                                    //           height: MySize.size16,
                                    //           child: CircularProgressIndicator(
                                    //               valueColor:
                                    //                   AlwaysStoppedAnimation<
                                    //                           Color>(
                                    //                       themeData.colorScheme
                                    //                           .onPrimary),
                                    //               strokeWidth: 1.4),
                                    //         )
                                    //       : ClipOval(
                                    //           child: Container(
                                    //             color: themeData
                                    //                 .colorScheme.primaryVariant,
                                    //             child: SizedBox(
                                    //                 width: MySize.size30,
                                    //                 height: MySize.size30,
                                    //                 child: Icon(
                                    //                   MdiIcons.arrowRight,
                                    //                   color: themeData
                                    //                       .colorScheme
                                    //                       .onPrimary,
                                    //                   size: MySize.size18,
                                    //                 )),
                                    //           ),
                                    //         ),
                                    // ),
                                  ],
                                ),
                              ),
                            )),
                        Center(
                          child: Container(
                            margin: Spacing.top(16),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                "I have already an account",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                        // AuthController.notice(themeData)
                      ],
                    ))));
      },
    );
  }

  void showMessage({String message = "Something wrong", Duration duration}) {
    if (duration == null) {
      duration = Duration(seconds: 3);
    }
    // _scaffoldKey.currentState.showSnackBar(
    //   SnackBar(
    //     duration: duration,
    //     content: Text(message,
    //         style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
    //             letterSpacing: 0.4, color: themeData.colorScheme.onPrimary)),
    //     backgroundColor: themeData.colorScheme.primary,
    //     behavior: SnackBarBehavior.fixed,
    //   ),
    // );
  }
}
