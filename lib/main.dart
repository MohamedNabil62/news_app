// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc_observre.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/theme-data.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/cubit/states.dart';
import 'layout/news_app/news_layout.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Diohelper.init();
 await CacheHelper.init();
 bool? isDark=CacheHelper.getData(kay: 'mode');
  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget
{
  final bool? isDark;
  const MyApp(this.isDark, {super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(
        create: (context) => NewsCubit()..getScience()..getBusiness()..getSports()..changemode(shardform: isDark)),
        ],
        child:BlocConsumer<NewsCubit,NewsStates>(
        listener:(context, state) => {
        },
    builder:(context, state) {
          return  MaterialApp(debugShowCheckedModeBanner: false,
              theme: lightmode,
              darkTheme: darkmode,
              themeMode:NewsCubit.get(context).mode? ThemeMode.light:ThemeMode.dark,
             home: Directionality(textDirection: TextDirection.ltr,
                  child:News_home(),
             )
          );
    })
    );

  }
}