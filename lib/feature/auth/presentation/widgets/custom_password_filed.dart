import 'package:animooo/feature/auth/presentation/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.passwordController});

  final TextEditingController? passwordController;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: widget.passwordController,
      obscureText: isVisible,
      hintText: '********',
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
