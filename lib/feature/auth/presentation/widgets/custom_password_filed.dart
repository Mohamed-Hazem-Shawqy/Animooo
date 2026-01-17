import 'package:animooo/core/utils/app_consts.dart';
import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.passwordController, this.validator});

  final TextEditingController? passwordController;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
        validator:  widget.validator,
           
      controller: widget.passwordController,
      obscureText: isVisible,
      hintText: AppStrings.kPasswordHintText,
      suffixIcon: GestureDetector(
        onTap: () {
          isVisible = !isVisible;
          setState(() {});
        },
        child: isVisible
            ? Icon(Icons.visibility_off_outlined)
            : Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
