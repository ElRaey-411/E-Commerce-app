import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/resources/colors_manager.dart';

class CustomAdsWidget extends StatefulWidget {
  final List<String> adsImages;

  const CustomAdsWidget({
    super.key,
    required this.adsImages,
  });

  @override
  State<CustomAdsWidget> createState() => _CustomAdsWidgetState();
}

class _CustomAdsWidgetState extends State<CustomAdsWidget> {
  static const Duration switchDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 1500);

  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(switchDuration, (_) {
      setState(() {
        _currentIndex =
            (_currentIndex + 1) % widget.adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: animationDuration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              widget.adsImages[_currentIndex],
              key: ValueKey(_currentIndex),
              height: 210.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 210.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              widget.adsImages.length,
                  (index) => Container(
                width: 8.w,
                height: 8.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? ColorsManager.blue
                      : ColorsManager.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
