import 'package:flutter/material.dart';
import 'package:movie_flix_app/app/utils/app_tags.dart';
import 'package:movie_flix_app/app/utils/color_constant.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.onChange,
  });

  final controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller.searchController,
        focusNode: controller.focusNode,
        onChanged: (val) {
          onChange(val);
        },
        onFieldSubmitted: (val) {
          controller.removeClearIcon();
        },
        decoration: InputDecoration(
          suffixIcon: controller.showClearIcon.value
              ? GestureDetector(
                  onTap: () {
                    controller.searchController.clear();
                  },
                  child: const Icon(Icons.clear))
              : const SizedBox.shrink(),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: controller.hasFocus.value
              ? const Icon(Icons.search)
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.search), Text(AppTags.search)],
                ),
          hintText: controller.hintText.value,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConstant.white),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: ColorConstant.white),
            borderRadius: BorderRadius.circular(8),
          ),
        ));
  }
}
