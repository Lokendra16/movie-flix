import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_app/app/modules/landing_page/controllers/landing_page_controller.dart';
import 'package:movie_flix_app/app/modules/movie_list/controllers/movie_list_controller.dart';
import 'package:movie_flix_app/app/modules/movie_list/views/movie_list_screen.dart';
import 'package:movie_flix_app/app/modules/top_rated/views/top_rated_screen.dart';
import 'package:movie_flix_app/app/utils/widgets/bottom_navigation_widget.dart';

class LandingPageScreen extends StatelessWidget {
  final landingPageController = LandingPageController();
  final movieListController = MovieListController();

  LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationWidget(landingPageController: landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              /// NOW PLAYING WIDGET
              MovieListScreen(),
              /// TOP RATED WIDGET
              TopRatedScreen(),
            ],
          )),
    );
  }
}
