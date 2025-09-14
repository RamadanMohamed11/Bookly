import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetsData.logo, height: 24),
        Spacer(),
        IconButton(
          onPressed: () {
            // using router to navigate
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
