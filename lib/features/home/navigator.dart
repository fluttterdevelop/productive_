import 'package:flutter/cupertino.dart';

import '../tasks/presentation/tasks_screen.dart';
import 'home.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatefulWidget {
  const TabNavigator({
    required this.navigatorKey,
    required this.tabItem,
    Key? key,
  }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final NavItemEnum tabItem;

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  Map<String, WidgetBuilder> _routeBuilders(
      {required BuildContext context, required RouteSettings settings}) {
    switch (widget.tabItem) {
      case NavItemEnum.tasks:
        return {
          TabNavigatorRoutes.root: (context) => TaskScreen(),
        };
      case NavItemEnum.expenses:
        return {
          TabNavigatorRoutes.root: (context) => const SizedBox(),
        };
      case NavItemEnum.create:
        return {
          TabNavigatorRoutes.root: (context) => const SizedBox(),
        };
      case NavItemEnum.calendar:
        return {
          TabNavigatorRoutes.root: (context) => const SizedBox(),
        };
      case NavItemEnum.stats:
        return {
          TabNavigatorRoutes.root: (context) => const SizedBox(),
        };

      default:
        return {
          TabNavigatorRoutes.root: (context) => Container(),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Navigator(
      key: widget.navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        final routeBuilders =
            _routeBuilders(context: context, settings: routeSettings);

        return CupertinoPageRoute<dynamic>(
          builder: (context) => routeBuilders.containsKey(routeSettings.name)
              ? routeBuilders[routeSettings.name]!(
                  context,
                )
              : Container(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

PageRouteBuilder fade({required Widget page, RouteSettings? settings}) =>
    PageRouteBuilder<Widget>(
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            1,
            curve: Curves.linear,
          ),
        ),
        child: child,
      ),
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
    );
