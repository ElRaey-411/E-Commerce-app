import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideListItem extends StatelessWidget {
  const SideListItem({super.key, required this.onTap, required this.isSelected, required this.title});
 final VoidCallback onTap;
 final bool isSelected;
 final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 6, vertical: isSelected? 6:24),
        color: isSelected ? ColorsManager.white: ColorsManager.whiteBlue,
        child:Row(
          children: [
            Visibility(
              visible: isSelected,
              child: Container(
                margin: REdgeInsets.all(6),
                height: 50.h,
                width: 8.w,
                decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Expanded(child: Text(title,style: Theme.of(context).textTheme.headlineSmall,)),
          ]
        ),
      ),
    );
  }
}
