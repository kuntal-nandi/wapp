import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wapp/Filter/Bloc/Filter%20cubit/filter_data_cubit.dart';
import 'package:wapp/Music%20Player/Bloc/play_music_bloc.dart';
import 'package:wapp/Quiz/data_center.dart';
import 'package:wapp/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizScore(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FilterDataCubit>(create: (context) => FilterDataCubit()),
          BlocProvider<PlayMusicBloc>(create: (context) => PlayMusicBloc()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
      ),
    );
  }
}
