import 'package:flutter/material.dart';

import '../../utils/app_color.dart';


class BrandWidget extends StatelessWidget {
  final String image;
  final String text;
  const BrandWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
         image, // Replace with actual image path
          height: 60,
          width: 80,
          fit: BoxFit.fill,
        ),
         Text(text,style: TextStyle(color: AppColors.primaryColor),)
      ],
    );
  }
}
