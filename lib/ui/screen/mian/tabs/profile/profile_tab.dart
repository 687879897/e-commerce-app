import 'package:flutter/material.dart';
import '../../../../../model/user-data.dart';
import '../../../../utils/app_color.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    UserData data = ModalRoute.of(context)!.settings.arguments as UserData;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12, top: 12),
            child: Text("Welcome, ${data.name}", style: TextStyle(color: AppColors.primaryColor, fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12, top: 12),
            child: Text("${data.email}", style: TextStyle(color: AppColors.primaryColor, fontSize: 15)),
          ),
          ProfileWidget(text1: "Your full name", text2: "${data.name}"),
          ProfileWidget(text1: "Your E-mail", text2: "${data.email}"),
          ProfileWidget(text1: "Your password", text2: "${data.passsword}"),
          ProfileWidget(text1: "Your mobile number", text2: "${data.phone}"),
          ProfileWidget(text1: "Your Address", text2: "6th October, street 11....."),
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String text1;
  final String text2;

  const ProfileWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, top: 12),
          child: Text(text1, style: TextStyle(color: AppColors.primaryColor, fontSize: 20)),
        ),
        Container(
          padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 12),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightBlue, width: 1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text2, style: TextStyle(color: AppColors.primaryColor, fontSize: 15)),
              Icon(Icons.edit),
            ],
          ),
        ),
      ],
    );
  }
}
