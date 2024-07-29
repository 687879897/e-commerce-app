import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class FormLabelWidget extends StatelessWidget {
  String label;
  FormLabelWidget({required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: AppColors.grey),
    );
  }
}
