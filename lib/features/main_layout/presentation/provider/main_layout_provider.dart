import 'package:e_commerce/features/main_layout/presentation/tabs/categories_tab/presentation/categories_tab.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/favourite_tab/favourite_tab.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/home_tab/presentation/home_tab.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/assets_manager.dart';

class MainLayoutProvider extends ChangeNotifier{
  int selectedTab = 0;
  int selectedCategory=0;
  List<Widget> tabs=[
    HomeTab(),
    CategoriesTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  List<String> categories = [
    'men',
    'women',
    'dawdmen',
    'mendhhhh',
    'me33333n',
    'me4111n',
    'mendadcc',
    'menccccccccccccccccccccccccccc',
  ];
  final List<String> adsImages = [
    ImagesAssets.ad1,
    ImagesAssets.ad2,
    ImagesAssets.ad3,
  ];

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

}