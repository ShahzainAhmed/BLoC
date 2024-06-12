import 'package:bloc_practice/bloc/color_bloc/color_event.dart';
import 'package:bloc_practice/bloc/color_bloc/color_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitialState()) {
    on<ColorIncrementEvent>((event, emit) {
      emit(ColorIncrementState(Colors.green));
    });

    on<ColorDecrementEvent>((event, emit) {
      emit(ColorDecrementState(Colors.red));
    });
  }
}
