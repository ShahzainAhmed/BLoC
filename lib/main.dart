import 'package:bloc_practice/bloc/color_bloc/color_bloc.dart';
import 'package:bloc_practice/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/view/counter/counter_screen.dart';
import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocProvider(
        create: (context) => ColorBloc(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
    // return MultiBlocProvider(
    //     providers: [
    //       BlocProvider<CounterBloc>(
    //         create: (context) => CounterBloc(),
    //       ),
    //       BlocProvider<ColorBloc>(
    //         create: (context) => ColorBloc(),
    //       )
    //     ],
    //     child: const MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: HomeScreen(),
    //     ));
  }
}
