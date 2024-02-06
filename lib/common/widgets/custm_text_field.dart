import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.keyboardType,
      this.prefixText,
      this.textAlign,
      this.readOnly,
      this.hintText,
      this.suffixIcon,
      this.onTap,
      this.onChanged,
      this.fontSize,
      this.autofocus});

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? prefixText;
  final TextAlign? textAlign;
  final bool? readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final double? fontSize;
  final bool? autofocus;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller ?? controller,
      keyboardType: readOnly == null ? keyboardType : null,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      onChanged: onChanged,
      autofocus: autofocus ?? false,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        prefixText: prefixText,
        suffix: suffixIcon,
        hintStyle: TextStyle(color: context.theme.greyColor),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colours.greenDark)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colours.greenDark, width: 2),
        ),
      ),
    );
  }
}
