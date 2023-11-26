import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_app/app/networking/api_client.dart';
import 'package:movie_flix_app/app/networking/response_model/now_playing/now_playing_response.dart';
import 'package:movie_flix_app/app/utils/app_tags.dart';
import 'package:movie_flix_app/app/utils/app_utils.dart';

class MovieListController extends GetxController {
  /// CREATING FOCUS NODE TO LISTEN THE FOCUS CHANGE ON TEXT FORM FIELD
  FocusNode focusNode = FocusNode();
  var hintText = AppTags.search.obs;
  var hasFocus = false.obs;
  TextEditingController searchController = TextEditingController();
  var showClearIcon = false.obs;

  /// FOR NOW PLAYING MOVIES
  List<Results> results = <Results>[].obs;
  List<Results> searchResults = <Results>[].obs;
  var isLoading = false;



  @override
  void onInit() {
    listenFocus();
    nowPlayingApi();
    super.onInit();
  }

  /// LISTENING THE FOCUS NODE WHEN USER TAP ON TEXT FORM FIELD
  listenFocus() {
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

  /// NOW PLAYING API
  void nowPlayingApi() async {
    isLoading = true;
    try {
      final client = ApiClient();
      var apiResponse = await client.getNowPlaying(AppTags.apiKey);
      if (apiResponse.results != null && apiResponse.results!.isNotEmpty) {
        results = apiResponse.results!;
        isLoading = false;
      }
    } catch (e) {
      AppUtils.errorSnackBar(message: "$e");
      isLoading = false;
    }
    update();
  }



  /// SEARCH QUERY
  onSearchTextChanged(String text, res) async {
    searchResults.clear();
    if (text.isEmpty) {
      return;
    }
    res.forEach((res) {
      if (res.title!.toLowerCase().contains(text) ||
          res.title!.toUpperCase().contains(text)) {
        searchResults.add(res);
        for (int i = 0; i < searchResults.length; i++)
          print("searchResult : ${searchResults[i].title}");
      }
    });
  }
}
