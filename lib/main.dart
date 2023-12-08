import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_explorer/bloc/home_screen_bloc.dart';
import 'package:cine_explorer/ui/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: MaterialApp(
        home: const HomeScreen(),
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
