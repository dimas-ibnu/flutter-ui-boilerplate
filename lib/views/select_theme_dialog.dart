import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../app_theme_notifier.dart';

class SelectThemeDialog extends StatefulWidget {
  @override
  _SelectThemeDialogState createState() => _SelectThemeDialogState();
}

class _SelectThemeDialogState extends State<SelectThemeDialog> {
  ThemeData themeData;

  void _handleRadioValueChange(int value) {
    Navigator.of(context).pop();
    setState(() {
      Provider.of<AppThemeNotifier>(context, listen: false).updateTheme(value);
    });
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return Dialog(
          child: Container(
            padding: Spacing.only(top: 16, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _handleRadioValueChange(AppTheme.themeLight);
                  },
                  child: Container(
                    padding: Spacing.only(top: 16, bottom: 0, left: 16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: value.themeMode(),
                          value: AppTheme.themeLight,
                          activeColor: themeData.colorScheme.primary,
                        ),
                        Text("Light",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                        
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _handleRadioValueChange(AppTheme.themeDark);
                  },
                  child: Container(
                    padding: Spacing.only(top: 0, bottom: 0, left: 16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: value.themeMode(),
                          value: AppTheme.themeDark,
                          activeColor: themeData.colorScheme.secondary,
                        ),
                        Text("Dark",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
