import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_friday_c9/model/get-product-response.dart';
import 'package:e_commerce_friday_c9/model/produect-details-model.dart';
import 'package:e_commerce_friday_c9/ui/screen/mian/tabs/fav/fav-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../screen/mian/tabs/home/home_view_model.dart';
import '../../screen/proudect-detials/proudect-details.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../app-loader.dart'; // Ensure this import is correct

class Product extends StatelessWidget {
  final ProductDM product;
  final bool isInCart;
  final bool isFav;

  const Product(this.product, {Key? key, required this.isInCart, required this.isFav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetails.routeName,
          arguments: ProductDetailsModel(
            name: product.title ?? "",
            description: product.description ?? "",
            images: product.images ?? [],
            price: product.price ?? 0,
            rating: product.ratingsAverage ?? 0,
            stock: product.ratingsQuantity ?? 0,
            id: product.id ?? "",
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
                  imageUrl: product.images?.isNotEmpty == true ? product.images![0] : " ",
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
                    icon: Image.asset(isFav ? AppAssets.truefave : AppAssets.falsefave),
                    onPressed: () {
                      final productId = product.id;
                      if (productId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Product ID is null')),
                        );
                        return;
                      }

                      if (isFav) {
                        viewModel.removeproductfromwatchlist(productId);
                      } else {
                        viewModel.addproducttowatchlist(productId);
                      }
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              product.title ?? "",
              textAlign: TextAlign.start,
              maxLines: 2,
              style: const TextStyle(height: 1),
            ),
            const Spacer(),
            Text("EGP ${product.price}", style: const TextStyle(fontSize: 15)),
            Row(
              children: [
                Text(
                  "Review (${product.ratingsAverage})",
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
                      final productId = product.id;
                      if (productId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Product ID is null')),
                        );
                        return;
                      }
                      if (isInCart) {
                        viewModel.removeproductfromcart(productId);
                      } else {
                        viewModel.addproducttocart(productId);
                      }
                    },
                    child: isInCart
                        ? const Icon(Icons.minimize_outlined, color: Colors.white)
                        : const Icon(Icons.add, color: Colors.white),
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
