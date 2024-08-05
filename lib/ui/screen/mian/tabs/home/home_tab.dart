import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../di.dart';
import '../../../../../model/catogry-response.dart';

import '../../../../../model/get-product-response.dart';
import '../../../../../model/prouductresponse.dart';
import '../../../../base/enums/base-screen-state.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/error_view.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_widget/catogry.dart';
import '../../../../widgets/main_widget/product.dart';
import 'home-state.dart';
import 'home_view_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
  viewModel.loadCategory();
  viewModel.loadProduct();
  viewModel.refreashcart();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>viewModel,
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            buildslider(),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(

                children: [Text("Catogry",style: TextStyle(color: AppColors.primaryColor),), Spacer(), Text("view all",style: TextStyle(color: AppColors.primaryColor))],
              ),
            ),
            BlocBuilder<HomeViewModel, HomeState>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state.catogrystate == BaseScreenState.success) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: buildCategoriesGridView(state.catogry!),
                    );
                  } else if (state.catogrystate == BaseScreenState.failuer) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: ErrorView(message: state.categoryErrorMessage),
                    );
                  } else {
                    return LoadingWidget();
                  }
                }),
            const SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Home Appliance",style: TextStyle(color: AppColors.primaryColor)),
            ),
            BlocBuilder<HomeViewModel, HomeState>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state.productstate == BaseScreenState.success) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: buildProductsListView(state.product!),
                    );
                  } else if (state.productstate == BaseScreenState.failuer) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: ErrorView(message: state.productErrorMessage),
                    );
                  } else {
                    return LoadingWidget();
                  }
                }),

          ],
        ),
      ),
    );
  }

  Widget buildslider() {
    return BlocBuilder<HomeViewModel, HomeState>(
        bloc: viewModel,
        builder: (context, state) {
          return CarouselSlider(
              items: state.ads
                  .map((ad) => Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        ad,
                        fit: BoxFit.fill,
                      )))
                  .toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .2,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
              ));
        });
  }

  Widget buildProductsListView(List<ProductDM> data) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          ProductDM products=data[index];
          return Product(products, isincart: viewModel.isinCart(products.id??" "),);
        });
  }

  Widget buildCategoriesGridView(List<CatogryDM> data) {
    return GridView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CategoryItem(data[index]);
        });
  }
}
