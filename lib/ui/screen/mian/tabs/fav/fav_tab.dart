import 'package:flutter/material.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_color.dart';

class FAVTab extends StatelessWidget {
  const FAVTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(
          itemCount: 10,
          itemBuilder:(context,index){
            return FavTab();
          }))

        ],
      ),
    );
  }
}
class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 12),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightBlue, width: 1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0), // Adjust the radius as needed
                child: Image.asset(
                  "assets/images/Frame 65.png",
                  height: 95,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nike Air Jordon", style: TextStyle(color: AppColors.primaryColor, fontSize: 20)),
                  const SizedBox(height: 10),
                  const Text("Black color", style: TextStyle(color: AppColors.primaryColor, fontSize: 13)),
                  Row(
                    children: [
                      const Text("EGP 1,200", style: TextStyle(color: AppColors.primaryColor, fontSize: 15)),
                      const SizedBox(width: 30), // Add some space between the price and the button
                      MaterialButton(
                        onPressed: () {
                          // Action for "Add to cart" button
                        },
                        color: AppColors.primaryColor, // Blue background color
                        textColor: Colors.white,
                        height: 30,
                        minWidth: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text("Add to cart"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 18,
          child: Image.asset(AppAssets.truefave)
        ),
      ],
    );
  }
}

