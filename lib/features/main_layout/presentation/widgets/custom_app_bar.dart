import 'package:e_commerce/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/colors_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: SvgPicture.asset(
        ImagesAssets.routeLogo,
        height: 25.h,
        width: 25.w,
        colorFilter: const ColorFilter.mode(
          ColorsManager.blue,
          BlendMode.srcIn,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: REdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorsManager.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorsManager.blue,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorsManager.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorsManager.blue,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 1,
                        color: ColorsManager.red,
                      ),
                    ),
                    prefixIcon: Image.asset(
                      IconAssets.search,
                    ),
                    hintText: "what do you search for?",
                  ),
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: SvgPicture.asset(
                  IconAssets.cart,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 100.h);
}
