import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_app_cubit.dart';
import 'package:news_app/cubit/news_app_states.dart';
import 'package:news_app/dio_helper/dio_helper.dart';
import 'package:news_app/new_layout_screen.dart';

void main() {
  DioHellper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsAppCubit()
              ..getBusinessData()
              ..getSportData()
              ..getScienceData()),
      ],
      child: BlocConsumer<NewsAppCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              scaffoldBackgroundColor: Colors.cyan[100],
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backgroundColor: Colors.cyan[400],
                elevation: 20,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.black54,
                  statusBarIconBrightness: Brightness.light,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.cyan,
                elevation: 70,
              ),
            ),
            darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                backgroundColor: Colors.black54,
                elevation: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black45,
                elevation: 70,
              ),
              scaffoldBackgroundColor: Colors.black38,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            themeMode: NewsAppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
