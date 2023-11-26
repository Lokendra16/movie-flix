import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix_app/app/modules/top_rated/controllers/top_rated_controller.dart';
import 'package:movie_flix_app/app/modules/top_rated/widgets/top_rated_list.dart';
import 'package:movie_flix_app/app/utils/app_tags.dart';
import 'package:movie_flix_app/app/utils/app_theme.dart';
import 'package:movie_flix_app/app/utils/color_constant.dart';
import 'package:movie_flix_app/app/utils/widgets/custom_divider.dart';
import 'package:movie_flix_app/app/utils/widgets/search_text_field.dart';

class TopRatedScreen extends GetView<TopRatedController> {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.amber,
      body: RefreshIndicator(
        onRefresh: () async {
          controller.topRatedApi();
        },
        child: Column(
          children: [
            /// SEARCH TEXT FIELD WIDGET
            Obx(
              () => Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchTextField(
                          onChange: (val) {
                            controller.onTextFieldNotEmpty();
                            controller.onSearchText(val);
                          },
                          controller: controller),
                    ),
                    controller.hasFocus.value
                        ? GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                AppTags.cancel,
                                style: AppTheme.ibm18Gray,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ),

            /// DIVIDER
            const CustomDivider(),
            GetBuilder<TopRatedController>(builder: (controller) {
              return Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Obx(
                      () => controller.topRatedSearchList.isNotEmpty

                          /// IT WILL RETURN THE SEARCH LIST
                          ? TopRatedList(
                              topRatedController: controller,
                              results: controller.topRatedSearchList,
                            )

                          /// IT WILL RETURN THE LIST FETCH FROM API
                          : TopRatedList(
                              results: controller.topRatedList,
                              topRatedController: controller,
                            ),
                    )),
              );
            }),
          ],
        ),
      ),
    );
  }
}
