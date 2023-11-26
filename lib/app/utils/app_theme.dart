import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_flix_app/app/utils/color_constant.dart';

class AppTheme {
  /// IBM 16 BLACK W500
  static final ibm16Black = GoogleFonts.ibmPlexSans(
      color: ColorConstant.black, fontSize: 16, fontWeight: FontWeight.w500);

  /// IBM 18 GRAY W500
  static final ibm18Gray = GoogleFonts.ibmPlexSans(
      color: ColorConstant.grey, fontSize: 18, fontWeight: FontWeight.w500);

  /// IBM 20 GRAY W600
  static final ibm20Black = GoogleFonts.ibmPlexSans(
      color: ColorConstant.black, fontSize: 20, fontWeight: FontWeight.w600);

  static final selectedLabelStyle = GoogleFonts.ibmPlexSans(
      color: ColorConstant.white, fontWeight: FontWeight.w500, fontSize: 12);

  static final unselectedLabelStyle = GoogleFonts.ibmPlexSans(
      color: ColorConstant.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);
}
