import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_redux_app/redux/app_actions.dart';
import 'package:flutter_redux_app/redux/app_reducer.dart';
import 'package:flutter_redux_app/redux/app_state.dart';

void main() {
  test("IncrementCounter tiene que incrementar una unidad", () {
    final result = appReducer(AppState.initialState(), IncrementCounter());
    expect(result.counter, equals(1));
  });
}
