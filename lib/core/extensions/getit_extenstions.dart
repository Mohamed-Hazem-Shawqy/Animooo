import 'package:animooo/core/database/api/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

extension GetitExtenstions on GetIt {
  GlobalKey<NavigatorState> get navigationState =>
      this<GlobalKey<NavigatorState>>();
 DioService get dioService => this<DioService>();
  BuildContext get globalContext => navigationState.currentState!.context;
  FlutterSecureStorage get secureStorage => this<FlutterSecureStorage>();
}
