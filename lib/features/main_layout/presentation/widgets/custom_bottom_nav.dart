import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';



class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 32,vertical: 12),
      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navItem(
            icon: IconAssets.home,
            index: 0,
          ),
          navItem(
            icon: IconAssets.category,
            index: 1,
          ),
          navItem(
            icon: IconAssets.favourite,
            index: 2,
          ),
          navItem(
            icon: IconAssets.profile,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget navItem({required String icon, required int index}) {
    final bool selected = currentIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      child: selected ? ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
          padding: REdgeInsets.all(12),
          color: ColorsManager.white,
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(ColorsManager.blue, BlendMode.srcIn),
          )
        )
      ): SvgPicture.asset(
        icon,
      ),
    );
  }
}
