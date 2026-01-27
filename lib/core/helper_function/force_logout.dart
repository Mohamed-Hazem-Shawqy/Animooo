import 'dart:developer';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/singletoon/shared_pref_singletoon.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/route_manager.dart';

void forceLogoutFunc() async {
  await getit.secureStorage.delete(key: AppStrings.kAccessToken);
  await getit.secureStorage.delete(key: AppStrings.kRefreshToken);
  await getit<SharedPrefSingletoon>().setBool(AppStrings.kisloggedin, false);

  // Optional: show a toast/snackbar
  log("Session expired, please login again");
  if (getit.globalContext.mounted) {
    AppNavigation.pushNamedAndRemoveUntil(
      getit.globalContext,
      RouteName.loginRoute,
    );
  }
}
