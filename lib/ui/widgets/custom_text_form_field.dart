import 'package:e_commerce_friday_c9/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;

  bool isPassword;

  TextEditingController controller;
  final String labeltext;
  final IconData iconData;

  String? Function(String?)? validator;
  TextInputType type;

  CustomTextFormField({
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    required this.type, required this.labeltext, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(labeltext)),
          suffixIcon: Icon(iconData),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: AppColors.black
      ),
      controller: controller,
      validator: validator,
      keyboardType: type ,
      obscureText: isPassword,
    );
  }
}

