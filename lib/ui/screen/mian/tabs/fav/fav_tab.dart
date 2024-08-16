import 'package:e_commerce_friday_c9/ui/screen/mian/tabs/fav/fav-state.dart';
import 'package:e_commerce_friday_c9/ui/screen/mian/tabs/fav/fav-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../di.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_color.dart';

class FavTab extends StatefulWidget {
  static String routeName = "cart";

  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  late FavViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<FavViewModel>();
    viewModel.refreashwatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: buildCart()),
        ],
      ),
    );
  }

  Widget buildCart() {
    return BlocBuilder<FavViewModel, FavState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state.watchList == null || state.watchList!.isEmpty) {
          return Center(child: Text("Your watch List is empty"));
        }

        return ListView.builder(
          itemCount: state.watchList!.length,
          itemBuilder: (context, index) {
            final product = state.watchList![index];
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 12),
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightBlue, width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.network(
                          state.watchList![index]?.imageCover ?? " ",
                          height: 95,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product?.title ?? " ",
                              style: TextStyle(
                                  color: AppColors.primaryColor, fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price : \$${product.price}",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 15),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        viewModel.addproducttocart(
                                            product.id ?? " ");
                                      },
                                      child: Center(
                                          child: Text(
                                        "Add To Cart",
                                        style: TextStyle(
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      ))),
                                  height: 35,
                                  width: 100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 18,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        viewModel.removeproductfromwatchlist(product.sId ?? "");
                      });
                    },
                    child: Image.asset(AppAssets.truefave),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
