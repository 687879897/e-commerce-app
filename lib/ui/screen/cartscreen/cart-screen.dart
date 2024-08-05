import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_friday_c9/di.dart';
import 'package:e_commerce_friday_c9/ui/screen/cartscreen/cart-state.dart';
import 'package:e_commerce_friday_c9/ui/screen/cartscreen/cart-view-model.dart';
import '../../utils/app_color.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<CartViewModel>();
    viewModel.refreashcart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
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
        children: [
          Expanded(child: buildCart()),
          buildBottomView(),
        ],
      ),
    );
  }

  Widget buildCart() {
    return BlocBuilder<CartViewModel, CartState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state.cartDm == null || state.cartDm!.products!.isEmpty) {
          return Center(child: Text("Your cart is empty"));
        }

        return ListView.builder(
          itemCount: state.cartDm!.products!.length,
          itemBuilder: (context, index) {
            final product = state.cartDm!.products![index];
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 12),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightBlue, width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.network(
                          state.cartDm!.products![index].product?.imageCover ?? " ",
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
                              product.product?.title ?? " ",
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
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          final newCount = (state.cartDm?.products![index].count ?? 0) - 1;
                                          if (newCount <= 0) {
                                            viewModel.removeproductfromcart(state.cartDm?.products![index].product?.id ?? "");
                                          } else {
                                            viewModel.updatecount(
                                              state.cartDm?.products![index].product?.id ?? "",
                                              newCount,
                                            );
                                          }
                                        },
                                        icon: Icon(Icons.remove, color: Colors.white),
                                      ),
                                      Text(
                                        "${state.cartDm?.products![index].count ?? 0}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          viewModel.addproducttocart(
                                            state.cartDm?.products![index].product?.id ?? "",
                                          );
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
                        viewModel.removeproductfromcart(product.sId ?? "");
                      });
                    },
                    child: Icon(Icons.delete_outline_outlined),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildBottomView() {
    return BlocBuilder<CartViewModel, CartState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state.cartDm == null) return SizedBox();

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price : \$${state.cartDm?.totalCartPrice} EGP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
