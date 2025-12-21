import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/main_layout/presentation/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/main_layout_provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainLayoutProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: ColorsManager.white,
      extendBody: false,
      body: provider.tabs[provider.selectedTab],
      bottomNavigationBar:CustomBottomNav(
      currentIndex: provider.selectedTab,
      onTap: provider.changeTab,
    )
    );
  }

}