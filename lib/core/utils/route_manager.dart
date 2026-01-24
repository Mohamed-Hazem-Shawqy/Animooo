import 'package:animooo/feature/auth/presentation/view/login_view.dart';
import 'package:animooo/feature/auth/presentation/view/signup_view.dart';
import 'package:animooo/feature/new_password/presentation/view/create_new_password_view.dart';
import 'package:animooo/feature/new_password/presentation/view/forget_password_view.dart';
import 'package:animooo/feature/otp/presentation/view/otp_view.dart';
import 'package:flutter/material.dart';

abstract class RouteManager {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    Widget widget;
    if (setting.name == RouteName.loginRoute.path) {
      widget = LoginView();
    } else if (setting.name == RouteName.signUpRoute.path) {
      widget = SignupView();
    } else if (setting.name == RouteName.otpRoute.path) {
      widget = OtpView(email: setting.arguments as String?);
    } else if (setting.name == RouteName.forgetYourPasswordRoute.path) {
      widget = ForgetPasswordView();
    } else if (setting.name == RouteName.createNewPasswordRoute.path) {
      widget = CreateNewPasswordView();
    } else {
      widget = UnKnownRoute(setting: setting);
    }

    return MaterialPageRoute(builder: (_) => widget, settings: setting);
  }
}

class UnKnownRoute extends StatelessWidget {
  const UnKnownRoute({super.key, required this.setting});
  final RouteSettings setting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('No route defined for ${setting.name}')),
    );
  }
}

enum RouteName {
  loginRoute('/'),
  signUpRoute('/SignUp'),
  otpRoute('/Otp'),
  forgetYourPasswordRoute('/ForgetYourPassword'),
  createNewPasswordRoute('/CreateNewPassword');

  final String path;
  const RouteName(this.path);
}
