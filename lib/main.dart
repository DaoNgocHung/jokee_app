import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokee_app/app/core/data/local/share_preference_key.dart';
import 'package:jokee_app/app/views/home/bloc/home_bloc.dart';
import 'package:jokee_app/app/views/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreference().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
