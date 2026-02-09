part of 'internet_connection_cubit.dart';

sealed class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object> get props => [];
}

class InternetConnectionInitial extends InternetConnectionState {}

class InternetConnectionStateConnected extends InternetConnectionState {}

class InternetConnectionStateDisconnected extends InternetConnectionState {}
