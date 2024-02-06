// ignore_for_file: non_constant_identifier_names, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';

extension ExtensionTheme on BuildContext {
  CustomThemeExtension get theme =>
      Theme.of(this).extension<CustomThemeExtension>()!;
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static const lightMode = CustomThemeExtension(
    CircleImageColor: Color(0xFF25D366),
    greyColor: Colours.greyLight,
    blueColor: Colours.blueLight,
    LangBtnBgColor: Color(0xFFF7F8FA),
    LangBtnHighLightColor: Color(0xFFE8E8ED),
    authAppbarTextColor: Colours.greenLight,
    photoIconBGColor: Color(0xFFF0F2F3),
    photoIconColor: Color.fromARGB(255, 11, 23, 29),
  );
  static const darkMode = CustomThemeExtension(
    CircleImageColor: Colours.greenDark,
    greyColor: Colours.greyDark,
    blueColor: Colours.blueDark,
    LangBtnBgColor: Color(0xFF1182229),
    LangBtnHighLightColor: Color(0xFF09141A),
    authAppbarTextColor: Color(0xFFE9EDEF),
    photoIconBGColor: Color(0xFF283339),
    photoIconColor: Color(0xFF617178),
  );
  final Color? CircleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? LangBtnBgColor;
  final Color? LangBtnHighLightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBGColor;
  final Color? photoIconColor;

  const CustomThemeExtension({
    this.photoIconBGColor,
    this.photoIconColor,
    this.CircleImageColor,
    this.greyColor,
    this.blueColor,
    this.LangBtnBgColor,
    this.LangBtnHighLightColor,
    this.authAppbarTextColor,
  });
  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? CircleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? LangBtnBgColor,
    Color? LangBtnHighLightColor,
    Color? authAppbarTextColor,
    Color? photoIconColor,
    Color? photoIconBGColor,
  }) {
    return CustomThemeExtension(
      CircleImageColor: CircleImageColor ?? this.CircleImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      LangBtnBgColor: LangBtnBgColor ?? this.LangBtnBgColor,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      photoIconBGColor: photoIconBGColor ?? this.photoIconBGColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
      LangBtnHighLightColor:
          LangBtnHighLightColor ?? this.LangBtnHighLightColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      CircleImageColor: Color.lerp(CircleImageColor, other.CircleImageColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      LangBtnBgColor: Color.lerp(LangBtnBgColor, other.LangBtnBgColor, t),
      photoIconBGColor: Color.lerp(photoIconBGColor, other.photoIconBGColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      authAppbarTextColor:
          Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      LangBtnHighLightColor:
          Color.lerp(LangBtnHighLightColor, other.LangBtnHighLightColor, t),
    );
  }
}
