import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/assets/theme/theme.dart';
import 'package:productive/features/authentication/presentation/pages/splash.dart';
import 'package:productive/repository/task.dart';
import 'package:productive/tasksBloc/tasks_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(repository: TaskRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme(),
        home: const Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
