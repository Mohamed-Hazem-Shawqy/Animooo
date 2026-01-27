import 'package:animooo/core/widgets/is_loggedin.dart';
import 'package:animooo/feature/auth/presentation/view/login_view.dart';
import 'package:animooo/feature/auth/presentation/view/signup_view.dart';
import 'package:animooo/feature/nav_bar/presentation/view/nav_bar_view.dart';
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
      final args = setting.arguments as OtpArgs;
      widget = OtpView(email: args.email, purpose: args.purpose);
    } else if (setting.name == RouteName.forgetYourPasswordRoute.path) {
      widget = ForgetPasswordView();
    } else if (setting.name == RouteName.createNewPasswordRoute.path) {
      final args = setting.arguments;
      String email = '';
      if (args is CreateNewPasswordArgs) {
        email = args.email;
      } else if (args is OtpArgs) {
        email = args.email;
      } else if (args is String) {
        email = args;
      }
      widget = CreateNewPasswordView(email: email);
    } else if (setting.name == RouteName.isLoggedIn.path) {
      widget = IsLoggedin();
    } else if (setting.name == RouteName.navBar.path) {
      widget = NavBarView();
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
  loginRoute('/Login'),
  signUpRoute('/SignUp'),
  otpRoute('/Otp'),
  forgetYourPasswordRoute('/ForgetYourPassword'),
  createNewPasswordRoute('/CreateNewPassword'),

  navBar('/NavBar'),
  isLoggedIn('/');

  final String path;
  const RouteName(this.path);
}

enum OtpPurpose { signUp, forgetPassword }

class OtpArgs {
  final String email;
  final OtpPurpose purpose;

  const OtpArgs({required this.email, required this.purpose});
}

class CreateNewPasswordArgs {
  final String email;
  const CreateNewPasswordArgs(this.email);
}
