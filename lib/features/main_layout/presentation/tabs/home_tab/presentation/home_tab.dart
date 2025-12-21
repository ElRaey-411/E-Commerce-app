import 'package:e_commerce/features/main_layout/presentation/tabs/home_tab/presentation/widgets/custom_ads.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/main_layout_provider.dart';

class HomeTab extends StatelessWidget {

  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainLayoutProvider>(context);
    return Column(
      children: [
        CustomAdsWidget(
          adsImages:provider.adsImages,
        ),
      ],
    );
  }
}
