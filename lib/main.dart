import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/Cubit/cubit.dart';
import 'package:news_app_test/Cubit/states.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>news_Cubit(),
      child: BlocConsumer<news_Cubit,news_States>(
        listener: (context ,state){},
        builder: (context,state){
          return  MaterialApp(

              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    color: Colors.white,
                  ),
               bottomNavigationBarTheme:BottomNavigationBarThemeData(
                 selectedItemColor: Colors.pinkAccent,
                 elevation: 20,
                 unselectedItemColor: Colors.black54,
               )
              ),
              darkTheme: ThemeData(
                  appBarTheme: AppBarTheme(
                    actionsIconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                      color: Colors.grey,

                  ),

                  bottomNavigationBarTheme:BottomNavigationBarThemeData(
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.pinkAccent,
                    elevation: 20,
                    unselectedItemColor: Colors.white,
                  )
              ),
              themeMode: news_Cubit.get(context).IsDark?ThemeMode.dark:ThemeMode.light,
              home: home()
          );
        },

      ),
    );
  }
}

