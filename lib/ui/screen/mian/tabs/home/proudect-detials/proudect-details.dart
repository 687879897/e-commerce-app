import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_friday_c9/model/produect-details-model.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';
import '../../../../../widgets/app-loader.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = "proudectdetails";

  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int productCount = 0;

  @override
  Widget build(BuildContext context) {
    var product=ModalRoute.of(context)!.settings.arguments as ProductDetailsModel;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            size: 30,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.shopping_cart_outlined,
              size: 30, color: AppColors.primaryColor)
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child:CachedNetworkImage(
              imageUrl: product.image,
              placeholder: (_, __) => const AppLoader(),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
              width: double.infinity,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .16,
            ),

            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightBlue),
              borderRadius: BorderRadius.circular(30),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Text("EGP ${product.price}",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 15))
              ],
            ),
          ),

          Row(
            children: [
              Container(
                width: 100,
                padding: EdgeInsets.all(13),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text("${product.stock} Sold",textAlign: TextAlign.center,style: TextStyle(color: AppColors.primaryColor),),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightBlue),
                  borderRadius: BorderRadius.circular(30),
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${product.rating}",
                    style: TextStyle(fontSize: 15),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                    size: 25,
                  ),
                  SizedBox(width: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (productCount > 0) productCount--;
                            });
                          },
                          icon: Icon(Icons.remove, color: Colors.white),
                        ),
                        Text(
                          '$productCount',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              productCount++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Description",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              product.descraption,style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.normal,
                fontSize:15),
            textAlign: TextAlign.left,),
          ),
          SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(

              children: [
              Text("Total price\n\nEGP 3,500", style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
                textAlign: TextAlign.left,),
              SizedBox(width: 100,),
              MaterialButton(
                onPressed: () {
                  // Action for "Add to cart" button
                },
                color: AppColors.primaryColor, // Blue background color
                textColor: Colors.white,
                height: 50,
                minWidth: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text("Add to cart", style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20)),
              ),
            ],),
          )
        ],
      ),
    ));
  }
}
