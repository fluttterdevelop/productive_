import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/icons.dart';

import 'package:productive/features/tasks/presentation/notes/notes.dart';
import 'package:productive/models/loading.status.dart';

import 'package:productive/tasksBloc/tasks_bloc.dart';

import '../../../assets/constants/colors.dart';
import '../../../models/priority.dart';
import '../../../models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SvgPicture.asset(AppIcons.mood)],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/profile.png"),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rozan",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Barlow",
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "hozar.rasan.matar115@gmail.com",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Barlow",
                                  fontWeight: FontWeight.w400,
                                ),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.star,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Premium",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22.5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SvgPicture.asset(
                              AppIcons.settings,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                            child: SvgPicture.asset(
                              AppIcons.article,
                              width: 16,
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Articles",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18.5,
                      ),
                      Divider(
                        height: 0.5,
                      ),
                      SizedBox(
                        height: 18.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.help,
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Help",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Barlow",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SvgPicture.asset(
                              AppIcons.terms,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Terms",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SvgPicture.asset(
                              AppIcons.faq,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "FAQ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Barlow",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 116,
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyDrawer()));
                          },
                          child: SvgPicture.asset(AppIcons.hamburger));
                    }),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => NotesPage()));
                        },
                        child: SvgPicture.asset(AppIcons.note)),
                    const SizedBox(width: 24),
                    SvgPicture.asset(AppIcons.notification),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    context.read<TaskBloc>().add(SearchTask(query: value));
                  },
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 13.5),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        AppIcons.search,
                      ),
                    ),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(AppIcons.filter)),
                    ),
                    filled: true,
                    fillColor: textFieldBackgroundColor,
                    hintText: 'Search by events, tasks.. ',
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                  child: Text(
                "Upcoming",
                style: TextStyle(color: white),
              )),
              Tab(
                  child: Text(
                "All",
                style: TextStyle(color: white),
              )),
            ],
          ),
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            switch (state.status) {
              case LoadingStatus.pure:
                context.read<TaskBloc>().add(LoadTasks());
                return const SizedBox();
              case LoadingStatus.loading:
                return const Center(child: CupertinoActivityIndicator());
              case LoadingStatus.loadedWithSuccess:
                return state.isSearching
                    ? ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16,
                        ),
                        itemBuilder: (_, index) =>
                            TaskItem(task: state.searchedTasks[index]),
                        separatorBuilder: (_, __) => const Gap(16),
                        itemCount: state.searchedTasks.length,
                      )
                    : TabBarView(
                        controller: tabController,
                        children: [
                          ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            itemBuilder: (_, index) =>
                                TaskItem(task: state.upcomingTasks[index]),
                            separatorBuilder: (_, __) => const Gap(16),
                            itemCount: state.upcomingTasks.length,
                          ),
                          ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            itemBuilder: (_, index) =>
                                TaskItem(task: state.allTasks[index]),
                            separatorBuilder: (_, __) => const Gap(16),
                            itemCount: state.allTasks.length,
                          )
                        ],
                      );
              case LoadingStatus.loadedWithFailure:
                return const SizedBox();
              default:
                return const SizedBox();
            }
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }
}

//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
//
//
// import '../../../models/loading.status.dart';
// import '../../../models/priority.dart';
// import '../../../models/task.dart';
// import '../../../repository/task.dart';
// import '../../../tasksBloc/tasks_bloc.dart';
// import '../../../tasksBloc/tasks_event.dart';
// import '../../../tasksBloc/tasks_state.dart';
//
// class App extends StatefulWidget {
//   const App({super.key});
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TaskBloc(repository: TaskRepository()),
//       child: Builder(builder: (context) {
//         return Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               controller: tabController,
//               tabs: const [
//                 Tab(text: 'Upcoming'),
//                 Tab(text: 'All'),
//               ],
//             ),
//           ),
//           body: BlocBuilder<TaskBloc, TaskState>(
//             builder: (context, state) {
//               switch (state.status) {
//                 case LoadingStatus.pure:
//                   context.read<TaskBloc>().add(LoadTasks());
//                   return const SizedBox();
//                 case LoadingStatus.loading:
//                   return const Center(child: CupertinoActivityIndicator());
//                 case LoadingStatus.loadedWithSuccess:
//                   return TabBarView(
//                     controller: tabController,
//                     children: [
//                       ListView.separated(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 20,
//                           horizontal: 16,
//                         ),
//                         itemBuilder: (_, index) =>
//                             TaskItem(task: state.upcomingTasks[index]),
//                         separatorBuilder: (_, __) => const Gap(16),
//                         itemCount: state.upcomingTasks.length,
//                       ),
//                       ListView.separated(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 20,
//                           horizontal: 16,
//                         ),
//                         itemBuilder: (_, index) =>
//                             TaskItem(task: state.allTasks[index]),
//                         separatorBuilder: (_, __) => const Gap(16),
//                         itemCount: state!.allTasks.length,
//                       )
//                     ],
//                   );
//                 case LoadingStatus.loadedWithFailure:
//                   return const SizedBox();
//                 default:
//                   return const SizedBox();
//               }
//             },
//           ),
//         );
//       }),
//     );
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
// }
//
class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF272C38),
          border: Border(
            right: BorderSide(
              width: 10,
              style: BorderStyle.solid,
              color: getProperColor(task.priority),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: task.iconColor,
                  ),
                  child: SvgPicture.asset(
                    task.icon,
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: task.isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        '${getProperTime(task.startDate)} - ${getProperTime(task.dueDate)}',
                        style: TextStyle(
                          color: const Color(0xFFABABAB),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          decoration: task.isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      context.read<TaskBloc>().add(ToggleTaskCheckedValue(
                            id: task.id,
                          ));
                    },
                    child:task.isChecked ? SvgPicture.asset(AppIcons.check_on): SvgPicture.asset(AppIcons.check),
                    ),
                // Checkbox(
                //   value: task.isChecked,
                //   onChanged: (value) {
                //     context.read<TaskBloc>().add(ToggleTaskCheckedValue(
                //           id: task.id,
                //         ));
                //   },
                //   checkColor: const Color(0xFF4B7FD6),
                //   activeColor: const Color(0xFF4B7FD6),
                // )
              ],
            ),
            if (task.note != null) ...{
              const Gap(8),
              Text(
                task.note!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  decoration: task.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )
            }
          ],
        ),
      ),
    );
  }

  String getProperTime(DateTime date) {
    final hour = date.hour < 10 ? '0${date.hour}' : '${date.hour}';
    final minute = date.minute < 10 ? '0${date.minute}' : '${date.minute}';
    return '$hour:$minute';
  }

  Color getProperColor(Priority priority) {
    switch (priority) {
      case Priority.high:
        return const Color(0xFFFF2752);
      case Priority.medium:
        return const Color(0xFFF6A845);
      case Priority.low:
        return const Color(0xFF44DB4A);
      default:
        return Colors.white;
    }
  }
}
