import 'package:bloc_practice/bloc/color_bloc/color_bloc.dart';
import 'package:bloc_practice/bloc/color_bloc/color_event.dart';
import 'package:bloc_practice/bloc/color_bloc/color_state.dart';
import 'package:bloc_practice/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_practice/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter BLoC"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ColorBloc, ColorState>(
              buildWhen: (previous, current) {
                return true;
              },
              builder: (context, state) {
                return Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: state.color,
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) {
                return true;
              },
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 35),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                    context.read<ColorBloc>().add(ColorDecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                    context.read<ColorBloc>().add(ColorIncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ));
  }
}
