import 'package:e_commerce/features/main_layout/presentation/tabs/categories_tab/presentation/widgets/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryDisplay extends StatelessWidget {
  const SubCategoryDisplay({super.key, required this.title, required this.subCategories});
  final String title;
  final List<SubCategoryModel> subCategories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 8,left: 24,right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 16.h,),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              )
              , itemCount: subCategories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(subCategories[index].image,fit: BoxFit.cover,),
                    ),
                    SizedBox(height: 8.h,),
                    Expanded(child: Text(subCategories[index].title,style: Theme.of(context).textTheme.headlineSmall)),
                  ],
                );
              }
          )
        ],
      ),
    );
  }
}
