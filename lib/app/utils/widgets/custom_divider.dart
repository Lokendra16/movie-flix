import 'package:flutter/material.dart';
import 'package:movie_flix_app/app/utils/color_constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: ColorConstant.grey,
    );
  }
}
