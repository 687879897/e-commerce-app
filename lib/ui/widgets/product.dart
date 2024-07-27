import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/prouductresponse.dart';
import '../utils/app_assets.dart';
import '../utils/app_color.dart';
import 'app-loader.dart';
import 'loading_widget.dart';

class Product extends StatefulWidget {
  final Products product;

  const Product(this.product, {super.key});

  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product> {
  @override
  void initState() {
    super.initState();

  }
  bool isFavorite = false; // State to manage favorite status
  bool isExpanded = false; // State to manage expanded/collapsed state

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(right: 12,left: 12,bottom: 6,top: 6),
        width: MediaQuery.of(context).size.width * .4,
        margin: const EdgeInsets.only(right: 12,left: 12,bottom: 6,top: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightBlue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.product.images![0] ?? "",
                  placeholder: (_, __) => const AppLoader(),
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .16,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Image.asset(
                      isFavorite ? AppAssets.truefave : AppAssets.falsefave,
                    ),
                    onPressed: toggleFavorite,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              widget.product.title ?? "",
              textAlign: TextAlign.start,
              maxLines: 2,
              style: const TextStyle(height: 1),
            ),
            const Spacer(),
            Text("EGP ${widget.product.price}",style: TextStyle(fontSize: 15)),
            Row(
              children: [
                Text("Review(${widget.product.rating})",style: TextStyle(fontSize: 11),),
                const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 20,
                ),

                const Spacer(),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {},
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
