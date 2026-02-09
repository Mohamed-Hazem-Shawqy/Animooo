import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  late final StreamSubscription _subscription;

  InternetConnectionCubit() : super(InternetConnectionInitial()) {
    _subscription = Connectivity().onConnectivityChanged.listen(
      _onStatusChanged,
    );
  }

  void _onStatusChanged(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      emit(InternetConnectionStateConnected());
    }
     else {
      emit(InternetConnectionStateDisconnected());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
