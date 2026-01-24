import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int initTimer = 59;
    Timer? _timer;
  void startTimer() {
   
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (initTimer > 0) {
        initTimer--;
        emit(CounterDecrease(initTimer));
      } else {
        _timer?.cancel();
      }
    });
  }
  @override
  Future<void> close() {
    _timer?.cancel();  
    return super.close();
  }
}
