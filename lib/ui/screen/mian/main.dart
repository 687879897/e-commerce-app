import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import 'mainviewmodel/main-view-model-state.dart';
import 'mainviewmodel/main_view_model.dart';

class Main extends StatefulWidget {
  static const String routeName = "home";

  Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  MainViewModel viewModel = getIt();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewModel, MainScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 70,),
              if (state.currentTabIndex != 3) ...[
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: const BorderSide(
                                width: 0.5,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "What do you search for?",
                            hintStyle: const TextStyle(
                                color: AppColors.primaryColor, fontSize: 16),
                            prefixIcon: IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(
                                Icons.search,
                                color: AppColors.primaryColor,
                                size: 30,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: AppColors.primaryColor, // Change this to your desired color
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 8.0),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.primaryColor,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
              if (state.searchResults.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.searchResults[index]),
                      );
                    },
                  ),
                )
              else
                Expanded(child: state.tabs[state.currentTabIndex]),
            ],
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              unselectedItemColor: AppColors.whiteColor,
              selectedItemColor: AppColors.primaryColor,
              showSelectedLabels: false,
              onTap: (index) {
                viewModel.setcurrenttabindex(index);
              },
              iconSize: 30,
              currentIndex: state.currentTabIndex,
              items: [
                buildBottomNavIcon(AppAssets.icHome, state.currentTabIndex == 0),
                buildBottomNavIcon(AppAssets.icCategories, state.currentTabIndex == 1),
                buildBottomNavIcon(AppAssets.icFav, state.currentTabIndex == 2),
                buildBottomNavIcon(AppAssets.icProfile, state.currentTabIndex == 3),
              ],
            ),
          ),
        );
      },
    );
  }

  buildBottomNavIcon(String asset, bool selected) {
    return BottomNavigationBarItem(
        icon: selected
            ? CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: ImageIcon(
              AssetImage(asset),
              size: 25,
            ))
            : ImageIcon(AssetImage(asset), size: 25),
        label: "");
  }
}