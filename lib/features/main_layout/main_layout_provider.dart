import 'package:e_commerce/features/main_layout/tabs/categories_tab.dart';
import 'package:e_commerce/features/main_layout/tabs/favourite_tab.dart';
import 'package:e_commerce/features/main_layout/tabs/home_tab.dart';
import 'package:e_commerce/features/main_layout/tabs/profile_tab.dart';
import 'package:flutter/material.dart';

class MainLayoutProvider extends ChangeNotifier{
  int selectedTab = 0;
  List<Widget> tabs=[
    HomeTab(),
    CategoriesTab(),
    FavouriteTab(),
    ProfileTab(),
  ];
}