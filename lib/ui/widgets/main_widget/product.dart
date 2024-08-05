import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_friday_c9/model/get-product-response.dart';
import 'package:e_commerce_friday_c9/model/produect-details-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../screen/mian/tabs/home/home_view_model.dart';
import '../../screen/proudect-detials/proudect-details.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../app-loader.dart'; // Ensure this import is correct

class Product extends StatefulWidget {
  final ProductDM product;
  final bool isincart;

  const Product(this.product, {super.key, required this.isincart});

  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product> {
  bool isFavorite = false; // State to manage favorite status

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        // Handle favorite action
      }
    });
  }

  late HomeViewModel viewModel = BlocProvider.of<HomeViewModel>(context);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetails.routeName,
          arguments: ProductDetailsModel(
            name: widget.product.title ?? "",
            description: widget.product.description ?? "",
            images: widget.product.images ?? [],
            price: widget.product.price ?? 0,
            rating: widget.product.ratingsAverage ?? 0,
            stock: widget.product.ratingsQuantity ?? 0,
            id: widget.product.id??" ",

          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width * .4,
        margin: const EdgeInsets.all(6),
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
                  imageUrl: widget.product.images?.isNotEmpty == true ? widget.product.images![0] : " ",
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
            Text("EGP ${widget.product.price}", style: const TextStyle(fontSize: 15)),
            Row(
              children: [
                Text(
                  "Review(${widget.product.ratingsAverage})",
                  style: const TextStyle(fontSize: 11),
                ),
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
                    onPressed: () {
                      final productId = widget.product.id;
                      if (productId == null) {
                        // Handle null case, show a message or prevent the action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Product ID is null')),
                        );
                        return;
                      }
                      if (widget.isincart) {
                        viewModel.removeproductfromcart(productId);
                      } else {
                        print("$productId");
                        viewModel.addproducttocart(productId);
                      }
                    },
                    child: widget.isincart ? const Icon(Icons.minimize_outlined, color: Colors.white) : const Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
