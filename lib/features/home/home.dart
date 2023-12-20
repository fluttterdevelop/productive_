import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/features/home/navbar.dart';
import 'package:productive/repository/create_task.dart';

import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';
import 'navigator.dart';
import 'widgets/nav_bar_item.dart';

enum NavItemEnum { tasks, expenses, create, calendar, stats }

class HomeScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;
  late double navBarWidth;

  late AnimationController controller;
  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.tasks: GlobalKey<NavigatorState>(),
    NavItemEnum.expenses: GlobalKey<NavigatorState>(),
    NavItemEnum.create: GlobalKey<NavigatorState>(),
    NavItemEnum.calendar: GlobalKey<NavigatorState>(),
    NavItemEnum.stats: GlobalKey<NavigatorState>(),
  };

  List<NavBar> labels = [];

  int _currentIndex = 0;
  int currentPage = 0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _controller = TabController(length: 5, vsync: this);
    controller.addListener(() {});
    _controller.addListener(onTabChange);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabChange() {
    setState(() => _currentIndex = _controller.index);
  }

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    labels = const [
      NavBar(id: 0, icon: AppIcons.tasks, title: "Tasks"),
      NavBar(id: 1, icon: AppIcons.expense, title: "Expense"),
      NavBar(id: 2, icon: AppIcons.create, title: "Create"),
      NavBar(id: 3, icon: AppIcons.calendar, title: "Calendar"),
      NavBar(id: 4, icon: AppIcons.stats, title: "Stats"),
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: white,
      ),
      child: HomeTabControllerProvider(
        controller: _controller,
        child: WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                    .currentState!
                    .maybePop();
            if (isFirstRouteInCurrentTab) {
              if (NavItemEnum.values[_currentIndex] != NavItemEnum.tasks) {
                changePage(0);
                return false;
              }
            }
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: Container(
              height: 75 + MediaQuery.of(context).padding.bottom,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: navigationBarBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff1F211C).withOpacity(0.08),
                    blurRadius: 30,
                    offset: const Offset(0, -4),
                  )
                ],
              ),
              child: TabBar(
                enableFeedback: true,
                onTap: (index) {
                  if (index == 2) {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: appBarColor.withOpacity(0.4),
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: FractionallySizedBox(
                              heightFactor: 1,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  /* mainAxisSize: MainAxisSize.min, */
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: cursorColor,
                                                  child: SvgPicture.asset(
                                                      AppIcons.money),
                                                ),
                                                Gap(8),
                                                Text(
                                                  "Income",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: onPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: cursorColor,
                                                  child: SvgPicture.asset(
                                                      AppIcons.expense),
                                                ),
                                                Gap(8),
                                                Text(
                                                  "Expense",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: onPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        const CreateTaskScreen(),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        cursorColor,
                                                    child: SvgPicture.asset(
                                                        AppIcons.tasks_solid),
                                                  ),
                                                  Gap(8),
                                                  Text(
                                                    "Tasks",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: onPrimaryColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const Gap(61),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: cursorColor,
                                                  child: SvgPicture.asset(
                                                      AppIcons.note),
                                                ),
                                                Gap(8),
                                                Text(
                                                  "Notes",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: onPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: cursorColor
                                                      .withOpacity(0.0),
                                                ),
                                                Gap(8),
                                                Text(
                                                  "sssss",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: onPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: cursorColor,
                                                  child: SvgPicture.asset(
                                                      AppIcons.tasks_star),
                                                ),
                                                Gap(8),
                                                Text(
                                                  "Event",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: onPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: SvgPicture.asset(
                                              AppIcons.close_create),
                                        ),
                                      ],
                                    ),
                                    const Gap(28),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
                indicator: const BoxDecoration(),
                controller: _controller,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 0,
                    item: labels[0],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 1,
                    item: labels[1],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 2,
                    item: labels[2],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 3,
                    item: labels[3],
                  ),
                  TabItemWidget(
                    onActiveTap: () {
                      _navigatorKeys[NavItemEnum.values[_currentIndex]]
                          ?.currentState
                          ?.popUntil((route) => route.isFirst);
                    },
                    isActive: _currentIndex == 4,
                    item: labels[4],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildPageNavigator(NavItemEnum.tasks),
                _buildPageNavigator(NavItemEnum.expenses),
                _buildPageNavigator(NavItemEnum.create),
                _buildPageNavigator(NavItemEnum.calendar),
                _buildPageNavigator(NavItemEnum.stats),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTabControllerProvider extends InheritedWidget {
  const HomeTabControllerProvider({
    required Widget child,
    required this.controller,
    Key? key,
  }) : super(key: key, child: child);

  final TabController controller;

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;

  static HomeTabControllerProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>()!;
}
