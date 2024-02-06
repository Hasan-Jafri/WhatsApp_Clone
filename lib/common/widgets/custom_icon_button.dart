import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final double? iconSize;
  final double? minWidth;
  final Color? background;
  final BoxBorder? border;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.minWidth,
    this.background,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        onPressed: onTap,
        splashColor: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        constraints:
            BoxConstraints(minWidth: minWidth ?? 45, minHeight: minWidth ?? 45),
        splashRadius: (minWidth ?? 45) - 25,
        iconSize: iconSize ?? 20,
        icon: Icon(
          icon,
        ),
        color: iconColor ?? context.theme.greyColor,
      ),
    );
  }
}
