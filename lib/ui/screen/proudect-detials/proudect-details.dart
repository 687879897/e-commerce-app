import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_friday_c9/ui/screen/proudect-detials/product-deatils-view-model.dart';
import 'package:e_commerce_friday_c9/ui/screen/proudect-detials/product-details-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:e_commerce_friday_c9/model/produect-details-model.dart';

import '../../../di.dart';
import '../../utils/app_color.dart';
import '../../widgets/app-loader.dart';
import '../cartscreen/cart-screen.dart';

class ProductDetails extends StatefulWidget {
  static String routeName = "productdetails";

  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentSlideIndex = 0;
  int count=0;


  bool isDescriptionExpanded = false;
  Color selectedColor = Colors.white;
  final CarouselController _carouselController = CarouselController();


  // List of colors to choose from
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];
  late ProductDateilsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<ProductDateilsViewModel>();
    viewModel.refreashcart();
  }

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductDetailsModel;
    return SafeArea(
      child: BlocBuilder<ProductDateilsViewModel,ProductDateilsState>(
        bloc: viewModel,
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Product Details",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              actions: [
                Icon(
                  Icons.search,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 15),
                Icon(Icons.shopping_cart_outlined, size: 30, color: AppColors.primaryColor),
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentSlideIndex = index;
                        });
                      },
                    ),
                    items: product.images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              placeholder: (_, __) => const AppLoader(),
                              errorWidget: (_, __, ___) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentSlideIndex,
                      count: product.images.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 4,
                      ),
                      onDotClicked: (index) {
                        _carouselController.animateToPage(index);
                      },
                    ),
                  ),              Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "EGP ${product.price}",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(13),
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(
                          "${product.stock} Sold",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
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
                                      count--;
                                    });

                                  },
                                  icon: Icon(Icons.remove, color: Colors.white),
                                ),
                                Text(
                                  '$count',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                   setState(() {
                                     count++;
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
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.description,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                          maxLines: isDescriptionExpanded ? null : 3,
                          overflow: isDescriptionExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDescriptionExpanded = !isDescriptionExpanded;
                            });
                          },
                          child: Text(
                            isDescriptionExpanded ? "See less" : "See more",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Choose a Color",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      children: colors.map((color) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedColor == color ? Colors.black : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "Total price\n\n${count*product.price}",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(width: 100),
                        MaterialButton(
                          onPressed: () {
                            viewModel.addproducttocart(product.id);
                            viewModel.updatecount(product.id, count);
                            Navigator.pushNamed(context, CartTab.routeName);

                          },
                          color: AppColors.primaryColor,
                          textColor: Colors.white,
                          height: 50,
                          minWidth: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Hero(
                            tag: 'addToCartButton', // Ensure this tag is unique
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
