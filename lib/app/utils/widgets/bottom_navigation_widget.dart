import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_app/app/modules/landing_page/controllers/landing_page_controller.dart';
import 'package:movie_flix_app/app/utils/app_tags.dart';
import 'package:movie_flix_app/app/utils/app_theme.dart';
import 'package:movie_flix_app/app/utils/color_constant.dart';

class BottomNavigationWidget extends StatelessWidget {
  final LandingPageController landingPageController;

  const BottomNavigationWidget({super.key, required this.landingPageController});
  @override
  Widget build(BuildContext context) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: ColorConstant.amber,
            unselectedItemColor: Colors.grey,
            selectedItemColor: ColorConstant.black,
            unselectedLabelStyle: AppTheme.unselectedLabelStyle,
            selectedLabelStyle: AppTheme.selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.movie_outlined,
                    size: 20.0,
                  ),
                ),
                label: AppTags.nowPlaying,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.star,
                    size: 20.0,
                  ),
                ),
                label: AppTags.topRated,
              ),
            ],
          ),
        )));
  }

}