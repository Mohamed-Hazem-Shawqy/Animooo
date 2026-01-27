import 'package:animooo/core/database/api/end_points.dart';
import 'package:animooo/core/extensions/getit_extenstions.dart';
import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/utils/app_const_string.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


Future<String> getNewAccessTokenFunc() async {
  final refreshToken = await getit<FlutterSecureStorage>().read(
    key: AppStrings.kRefreshToken,
  );
  final response = await getit.dioService.post(
    path: EndPoints.generateNewAccessToken,
    queryParameters: {'refresh_token': refreshToken},
  );

  return response['access_token'];
}
