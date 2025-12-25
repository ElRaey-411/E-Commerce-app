import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSuggestionItem extends StatelessWidget {
  const HomeSuggestionItem({super.key, required this.image, required this.title, required this.price, required this.rating});

  final String image;
  final String title;
  final String price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 250.h,
      margin: REdgeInsets.only(right: 16,bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.blue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(image),
              InkWell(
                onTap: (){},
                child: Container(
                  margin: REdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(Icons.favorite_border_outlined,color: ColorsManager.blue,),
                ),
              )
            ]
          ),
          Padding(
            padding:REdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h,),
                Text(title),
                SizedBox(height: 8.h,),
                Row(
                  children: [
                    Text('Review ($rating)   '),
                    Icon(Icons.star,color: Colors.amber,size: 16.sp,),
                  ],
                ),
                SizedBox(height: 8.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('EGP $price'),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        padding: REdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ColorsManager.blue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.add,color: ColorsManager.white,),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
