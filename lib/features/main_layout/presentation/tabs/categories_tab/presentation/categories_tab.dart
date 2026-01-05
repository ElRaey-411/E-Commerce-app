import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/categories_tab/presentation/widgets/side_list_item.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/categories_tab/presentation/widgets/sub_category_display.dart';
import 'package:e_commerce/features/main_layout/presentation/tabs/categories_tab/presentation/widgets/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/main_layout_provider.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainLayoutProvider>(context);
    return Padding(
      padding: REdgeInsets.only(left: 16, right: 24, top: 8),
      child: Row(
        children: [
          Container(
            width: 137.w,
            height: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.whiteBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),

            ),
            child:ListView.builder(
              itemCount: provider.categories.length,
              itemBuilder: (context, index) {
                return SideListItem(
                  onTap: () {
                    provider.changeCategory(index);
                  },
                  isSelected: provider.selectedCategory == index,
                  title: provider.categories[index],
                );
              }
            )
          ),
          Expanded(
            child: SubCategoryDisplay(title: provider.categories[provider.selectedCategory],
                subCategories: SubCategoryModel.subCategories),
          )
        ],
      ),
    );
  }
}
