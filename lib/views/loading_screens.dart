import 'package:boilerplate_ui/app_theme.dart';
import 'package:boilerplate_ui/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

// Loading Screens
class LoadingScreens {
  static Widget getHomeLoading(BuildContext context, ThemeData themeData,
      CustomAppTheme customAppTheme) {

        
    List<Widget> listCategory = [];
    for (int i = 0; i < 4; i++) {
      listCategory.add(Padding(
          child: boxShimmer(width: MySize.size72, height: MySize.size72),
          padding: Spacing.all(5)));
    }

    List<Widget> listNewsItem = [];
    for (int i = 0; i < 4; i++) {
      listNewsItem.add(Padding(
        padding: Spacing.vertical(10),
        child:
      boxShimmer(
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 1)
      ));
    }

    return Shimmer.fromColors(
      baseColor: customAppTheme.shimmerBaseColor,
      highlightColor: customAppTheme.shimmerHighlightColor,
      child: Container(
        padding: Spacing.all(24),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boxShimmer(width: MySize.size160, height: MySize.size20),
                    SizedBox(height: 5),
                    boxShimmer(width: MySize.size200, height: MySize.size20)
                  ],
                ),
                SizedBox(height: 20),
                circleShimmer(size: MySize.size50)
              ],
            ),
            SizedBox(
              height: 16,
            ),
            boxShimmer(
                height: MediaQuery.of(context).size.width * 0.4,
                width: MediaQuery.of(context).size.width * 0.5),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: listCategory,
            ),
            SizedBox(height: 16),

            Column(children: listNewsItem)
          ],
        ),
      ),
    );
  }

  static Widget getCartLoadingScreen(
      BuildContext context, ThemeData themeData, CustomAppTheme customAppTheme,
      {int itemCount = 2}) {
    Widget singleLoading = Shimmer.fromColors(
        baseColor: customAppTheme.shimmerBaseColor,
        highlightColor: customAppTheme.shimmerHighlightColor,
        child: Container(
          padding: Spacing.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: Spacing.only(bottom: 12),
                child: Container(
                  height: 8,
                  width: 120,
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: Spacing.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: 64,
                      width: 64,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Container(
                        padding: Spacing.horizontal(8.0),
                        height: 64,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 8, width: 160, color: Colors.grey),
                                SizedBox(height: 8),
                                Container(
                                    height: 8, width: 80, color: Colors.grey),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: 8, width: 80, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: Spacing.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getOrderLoadingScreen(
      BuildContext context, ThemeData themeData, CustomAppTheme customAppTheme,
      {int itemCount = 3}) {
    Widget singleLoading = Shimmer.fromColors(
      baseColor: customAppTheme.shimmerBaseColor,
      highlightColor: customAppTheme.shimmerHighlightColor,
      child: Container(
        padding: Spacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 12,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: Spacing.only(top: 8.0),
                        child: Container(
                          height: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: Spacing.only(top: 16.0),
                        child: Container(
                          height: 8,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                          padding: Spacing.only(top: 8),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: Spacing.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getCouponLoadingScreen(
      BuildContext context, ThemeData themeData, CustomAppTheme customAppTheme,
      {int itemCount = 3}) {
    Widget singleLoading = Shimmer.fromColors(
      baseColor: customAppTheme.shimmerBaseColor,
      highlightColor: customAppTheme.shimmerHighlightColor,
      child: Container(
        padding: Spacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey,
                ),
                Container(
                  height: 40,
                  padding: Spacing.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 64,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 8,
                        width: 136,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: Spacing.only(top: 16),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 80,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 8,
                        width: 80,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Container(
                    height: 24,
                    width: 80,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: Spacing.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getAddressLoadingScreen(
      BuildContext context, ThemeData themeData, CustomAppTheme customAppTheme,
      {int itemCount = 3}) {
    Widget singleLoading = Shimmer.fromColors(
      baseColor: customAppTheme.shimmerBaseColor,
      highlightColor: customAppTheme.shimmerHighlightColor,
      child: Container(
        padding: Spacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              MdiIcons.mapMarker,
              color: themeData.colorScheme.onBackground,
              size: MySize.size32,
            ),
            Container(
              padding: Spacing.only(left: 8),
              height: 32,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 8,
                    width: 140,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 8,
                    width: 140,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    List<Widget> list = [];
    for (int i = 0; i < itemCount; i++) {
      list.add(Container(padding: Spacing.all(16), child: singleLoading));
    }
    return Column(
      children: list,
    );
  }

  static Widget getReviewLoadingScreen(BuildContext context,
      ThemeData themeData, CustomAppTheme customAppTheme) {
    return Shimmer.fromColors(
      baseColor: customAppTheme.shimmerBaseColor,
      highlightColor: customAppTheme.shimmerHighlightColor,
      child: Container(
        padding: Spacing.all(16),
        child: Column(
          children: <Widget>[
            Container(
              padding: Spacing.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 56,
                    width: 56,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: Spacing.only(left: 16),
                    height: 56,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 8,
                          width: 140,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 8,
                          width: 80,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: Spacing.only(top: 32.0, bottom: 16),
              child: Container(
                height: 16,
                width: 120,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 120,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  static Widget getConfirmPaymentLoadingScreen(BuildContext context,
      ThemeData themeData, CustomAppTheme customAppTheme) {
    return Shimmer.fromColors(
      baseColor: customAppTheme.shimmerBaseColor,
      highlightColor: customAppTheme.shimmerHighlightColor,
      child: Container(
        padding: Spacing.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 8,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 8,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget getSimpleImageScreen(
      BuildContext context, ThemeData themeData, CustomAppTheme customAppTheme,
      {double width = 60, double height = 60}) {
    Widget singleLoading = Shimmer.fromColors(
        baseColor: customAppTheme.shimmerBaseColor,
        highlightColor: customAppTheme.shimmerHighlightColor,
        child: Container(
          height: height,
          width: width,
          color: Colors.grey,
        ));
    return singleLoading;
  }

  static Widget boxShimmer({double height, double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
    );
  }

  static Widget circleShimmer({double height, double size}) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }
}
