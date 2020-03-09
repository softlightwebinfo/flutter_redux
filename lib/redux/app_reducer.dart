import 'package:flutter_redux_app/redux/app_actions.dart';
import 'package:flutter_redux_app/redux/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IncrementCounter) {
    return state.copyWith(
      counter: state.counter + 1,
    );
  } else if (action is DecrementCounter) {
    return state.copyWith(
      counter: state.counter - 1,
    );
  }
  return state;
}
