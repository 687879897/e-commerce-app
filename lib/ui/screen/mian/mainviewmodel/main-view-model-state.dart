import 'package:flutter/material.dart';

import '../tabs/categories/categories_tab.dart';
import '../tabs/fav/fav_tab.dart';
import '../tabs/home/home_tab.dart';
import '../tabs/profile/profile_tab.dart';

class MainScreenState {
  int currentTabIndex;
  static const List<Widget> defaultTabs = [
    HomeTab(),
    CategoriesTab(),
    FAVTab(),
    ProfileTab(),
  ];
  List<Widget> tabs;
  List<String> searchResults;

  MainScreenState({
    this.currentTabIndex = 0,
    List<Widget>? tabs,
    this.searchResults = const [],
  }) : tabs = tabs ?? defaultTabs;

  MainScreenState copyWith({
    int? currentTabIndex,
    List<Widget>? tabs,
    List<String>? searchResults,
  }) {
    return MainScreenState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      tabs: tabs ?? this.tabs,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}
