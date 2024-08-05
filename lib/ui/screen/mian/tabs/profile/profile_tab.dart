import 'package:e_commerce_friday_c9/di.dart';
import 'package:e_commerce_friday_c9/ui/base/enums/base-screen-state.dart';
import 'package:e_commerce_friday_c9/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../model/prouductresponse.dart';
import '../../../../widgets/app-loader.dart';
import '../../../../widgets/errorveiw.dart';
import '../../../../widgets/main_widget/all-catogry-widget.dart';
import '../categories/categories-state.dart';
import '../categories/categories-viewmodel.dart';


class AllCatogries extends StatefulWidget {
  static String routeName="AllCatogries";

  const AllCatogries({super.key});

  @override
  State<AllCatogries> createState() => _AllCatogriesState();
}

class _AllCatogriesState extends State<AllCatogries> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.loadProduct();
  }
  Brandviewmodel viewmodel=getIt();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<Brandviewmodel, BrandState>(
              bloc: viewmodel,
              builder: (context, state) {
                if (state.brandState == BaseScreenState.success) {
                  return buildProductsListView(state.products??[]);
                } else if (state.brandState == BaseScreenState.failuer) {
                  return ErrorVeiw(
                    error: state.brandErrorMessage,
                    refresh: () {
                      viewmodel.loadProduct();
                    },
                  );
                } else {
                  return const AppLoader();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductsListView(List<Products> data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7, // Adjust aspect ratio as needed
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return AllCatogry(data[index], isincart: true,);
        },
      ),
    );
  }
}

