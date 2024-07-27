import 'package:e_commerce_friday_c9/ui/screen/mian/tabs/categories/categories-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../di.dart';
import '../../../../../model/brand-response.dart';
import '../../../../../model/brandrespone.dart';
import '../../../../base/enums/base-screen-state.dart';
import '../../../../utils/app_color.dart';
import '../../../../widgets/catogry-tab.dart';
import '../../../../widgets/error_view.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/tabwidget.dart';
import 'categories-viewmodel.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  Brandviewmodel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.loadbrand();
    viewModel.loadspecificbrand();

  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 10, // Number of tabs
      child: Scaffold(
        body: Row(
          children: [
            BlocBuilder<Brandviewmodel, BrandState>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state.brandState == BaseScreenState.success) {
                    return firstwidget(data: state.brandData??[],);
                  } else if (state.brandState == BaseScreenState.failuer) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: ErrorView(message: state.brandErrorMessage),
                    );
                  } else {
                    return const LoadingWidget();
                  }
                }),
            BlocBuilder<Brandviewmodel, BrandState>(
                bloc: viewModel,
                builder: (context, state) {
                  if (state.brandState == BaseScreenState.success) {
                    return secongwidget(data: state.brandData??[],brand: state.onebrand??[],);
                  } else if (state.brandState == BaseScreenState.failuer) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: ErrorView(message: state.brandErrorMessage),
                    );
                  } else {
                    return const LoadingWidget();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
class secongwidget extends StatelessWidget {
  final List<Data>data;
  final List<Dm>brand;
  const secongwidget({super.key, required this.data, required this.brand});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 4,
      child: TabBarView(
        children: [

          Column(
            children: [
              CatogryTab(image: data[0].image??" ",text: data[0].name??" ",),
              BrandImage(brand: brand,i: 0,)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[1].image??" ",text: data[1].name??" ",),
              BrandImage(brand: brand,i: 6)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[2].image??" ",text: data[2].name??" ",),
              BrandImage(brand: brand,i: 12)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[3].image??" ",text: data[3].name??" ",),
              BrandImage(brand: brand,i: 18)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[4].image??" ",text: data[4].name??" ",),
              BrandImage(brand: brand,i: 24)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[5].image??" ",text: data[5].name??" ",),
              BrandImage(brand: brand,i: 30)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[6].image??" ",text: data[6].name??" ",),
              BrandImage(brand: brand,i: 36)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[7].image??" ",text: data[7].name??" ",),
              BrandImage(brand: brand,i: 42)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[8].image??" ",text: data[8].name??" ",),
              BrandImage(brand: brand,i: 48)

            ],
          ),
          Column(
            children: [
              CatogryTab(image: data[9].image??" ",text: data[9].name??" ",),
              BrandImage(brand: brand,i: 54)

            ],
          ),


        ],
      ),
    );
  }
}

class firstwidget extends StatefulWidget {
  final List<Data>data;
  const firstwidget({super.key, required this.data});

  @override
  State<firstwidget> createState() => _firstwidgetState();
}

class _firstwidgetState extends State<firstwidget> {
  int _selectedIndex = 0; // Track the selected tab index
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RotatedBox(
          quarterTurns: 3,
          child: Container(
            color: const Color(0xffDBE4ED),
            child: TabBar(
              labelPadding: EdgeInsets.all(7),
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent, // Set to transparent for custom indicator
              isScrollable: false,
              labelColor: Colors.transparent, // Unnecessary if using custom TabWidget
              unselectedLabelColor: Colors.transparent, // Unnecessary if using custom TabWidget
              tabs: List.generate(10, (index) {
                return TabWidget(
                  text: widget.data[index].name??" ", // Replace with actual tab text
                  color: _selectedIndex == index
                      ? AppColors.primaryColor
                      : Colors.transparent,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}



