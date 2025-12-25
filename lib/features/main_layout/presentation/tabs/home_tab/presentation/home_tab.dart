import 'package:e_commerce/features/main_layout/presentation/tabs/home_tab/presentation/widgets/category_item.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/home_tab/presentation/widgets/custom_ads.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/home_tab/presentation/widgets/home_suggestion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/main_layout_provider.dart';

class HomeTab extends StatelessWidget {

  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainLayoutProvider>(context);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            CustomAdsWidget(
              adsImages:provider.adsImages,
            ),
            SizedBox(height: 24.h,),
            Text('Categories',style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 16.h,),
            SizedBox(
              height:275.h,
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio:1.2,
                ),
                children: const [
                  CategoryItem(image:'assets/images/women_category.png', title: 'women'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'men'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'eee'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'womee'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'tttgdg'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'womfse'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'fsef'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'dawda'),
                  CategoryItem(image:'assets/images/women_category.png', title: 'womdawd'),
                ],
              ),
            ),
            SizedBox(height: 24.h,),
            Text('Home Appliance',style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 16.h,),
            SizedBox(
              height: 235.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  HomeSuggestionItem(
                    image:'assets/images/Frame.png',
                    title: 'Home Appliance',
                    price: '1000',
                    rating: 4.5,
                  ),
                  HomeSuggestionItem(
                    image:'assets/images/Frame.png',
                    title: 'Home ',
                    price: '100',
                    rating: 4,
                  ),
                  HomeSuggestionItem(
                    image:'assets/images/Frame.png',
                    title: 'Appliance',
                    price: '4000',
                    rating: 5,
                  ),
                  HomeSuggestionItem(
                    image:'assets/images/Frame.png',
                    title: 'H666',
                    price: '1060',
                    rating: 6,
                  ),
                  HomeSuggestionItem(
                    image:'assets/images/Frame.png',
                    title: '5645',
                    price: '5600',
                    rating: 46,
                  ),
                  HomeSuggestionItem(
                    image:'assets/images/Frame.png',
                    title: '2222',
                    price: '55',
                    rating: 77,
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
