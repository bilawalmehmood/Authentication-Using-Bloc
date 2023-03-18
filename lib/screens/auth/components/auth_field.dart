import 'package:authenticatio_with_bloc/res/app_colors.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double? width;
  final VoidCallback? suffixPressed;

  const AuthField(
      {Key? key,
      this.maxLength,
      this.prefixIcon,
      this.suffixPressed,
      this.suffixIcon,
      this.onChanged,
      this.controller,
      this.hintText,
      this.labelText,
      this.keyboardType,
      this.textInputAction,
      this.obscureText = false,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(
      context,
      color: Colors.blue,
      width: 2,
    ));
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 74,
      color: AppColors.secondaryColor,
      // alignment: Alignment.center,
      width: width ?? MediaQuery.of(context).size.width * 0.8,

      child: TextField(
        maxLength: maxLength,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon:
              prefixIcon != null ? Icon(prefixIcon, color: Colors.blue) : null,
          suffixIcon: InkWell(
              onTap: suffixPressed,
              child: Icon(suffixIcon, color: AppColors.primaryColor)),
          hintText: hintText,
          hintStyle:
              const TextStyle(fontSize: 15, color: AppColors.primaryColor),
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 20, color: Colors.blue),
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          border: inputBorder,
          contentPadding: const EdgeInsets.only(bottom: 14, left: 5),
        ),
      ),
    );
  }
}
