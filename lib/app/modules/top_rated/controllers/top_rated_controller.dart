import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_app/app/networking/api_client.dart';
import 'package:movie_flix_app/app/networking/response_model/now_playing/now_playing_response.dart';
import 'package:movie_flix_app/app/utils/app_tags.dart';
import 'package:movie_flix_app/app/utils/app_utils.dart';

class TopRatedController extends GetxController {
  FocusNode focusNode = FocusNode();
  var hintText = AppTags.search.obs;
  var hasFocus = false.obs;
  TextEditingController searchController = TextEditingController();
  var showClearIcon = false.obs;
  var isLoading = false;

  /// FOR TAP RATED MOVIES
  List<Results> topRatedList = <Results>[].obs;
  List<Results> topRatedSearchList = <Results>[].obs;

  @override
  void onInit() {
    listenFocusNode();
    topRatedApi();
    super.onInit();
  }

  /// LISTENING THE FOCUS NODE WHEN USER TAP ON TEXT FORM FIELD
  listenFocusNode() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hasFocus.value = true;
      } else {
        hasFocus.value = false;
      }
    });
  }

  /// SHOW CLEAR ICON WHEN TEXT FIELD IS NOT EMPTY FUNCTION
  void onTextFieldNotEmpty() {
    if (searchController.text.isNotEmpty) {
      showClearIcon.value = true;
    } else {
      showClearIcon.value = false;
    }
  }

  /// HIDE CLEAR ICON WHEN USER CLICK ON SUBMITTED BUTTON
  void removeClearIcon() {
    showClearIcon.value = false;
  }


  /// GET TOP RATED API
  void topRatedApi() async {
    isLoading = true;
    try {
      final client = ApiClient();
      var response = await client.getTopRated(AppTags.apiKey);
      if (response.results != null && response.results!.isNotEmpty) {
        topRatedList = response.results!;
        isLoading = false;
      }
      isLoading = false;
    } catch (e) {
      AppUtils.errorSnackBar(message: "$e");
      isLoading = false;
    }
    update();
  }

  /// SEARCH QUERY
  onSearchText(String text) async {
    topRatedSearchList.clear();
    if (text.isEmpty) {
      return;
    }
    topRatedList.forEach((res) {
      if (res.title!.toLowerCase().contains(text) ||
          res.title!.toUpperCase().contains(text)) {
        topRatedSearchList.add(res);
        for (int i = 0; i < topRatedSearchList.length; i++) {
          debugPrint("searchResult : ${topRatedSearchList[i].title}");
        }
      }
    });
  }
}
