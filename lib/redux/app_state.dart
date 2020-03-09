import 'package:flutter/material.dart';

class AppState {
  final int counter;
  final int counterX;

  AppState({@required this.counterX, @required this.counter});

  factory AppState.initialState() {
    return AppState(counter: 0, counterX: 10);
  }

  AppState copyWith({int counter, int counterX}) {
    return AppState(
      counter: counter ?? this.counter,
      counterX: counterX ?? this.counterX,
    );
  }
}
