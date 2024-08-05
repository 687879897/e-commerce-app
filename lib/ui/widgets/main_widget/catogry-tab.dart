import 'package:e_commerce_friday_c9/di.dart';
import 'package:e_commerce_friday_c9/ui/screen/mian/tabs/categories/categories-viewmodel.dart';
import 'package:flutter/material.dart';


import '../../../model/brandrespone.dart';
import '../../utils/app_color.dart';
import 'imagewidget.dart';

class CatogryTab extends StatelessWidget {
  final String image;
  final String text;

   CatogryTab({super.key, required this.image, required this.text});

  Brandviewmodel viewmodel=getIt();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Add padding around the image
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12), // Add border radius
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 230, // Adjust height as needed
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 80),
                MaterialButton(
                  onPressed: () {
                  },
                  color: AppColors.primaryColor, // Blue background color
                  textColor: Colors.white,
                  height: 40,
                  minWidth: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("Shop Now"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BrandImage extends StatelessWidget {
 final List<Dm>brand;
 final int i;
  const BrandImage({super.key, required this.brand, required this.i, });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          childAspectRatio: .6
        ),
        padding: const EdgeInsets.all(10),
        itemCount: 6, // Number of grid items
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child:  BrandWidget(image:brand[index+i].image??" ",text:brand[index+i].name??" " ),
          );
        },
      ),
    );
  }
}

