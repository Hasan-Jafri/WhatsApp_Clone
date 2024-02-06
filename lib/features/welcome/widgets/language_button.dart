import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });
  showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    color: context.theme.greyColor!.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    CustomIconButton(
                      onTap: () => Navigator.of(context).pop(),
                      icon: Icons.close_outlined,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "App Language",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: context.theme.greyColor!.withOpacity(0.3),
                  thickness: 0.5,
                ),
                RadioListTile(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                  activeColor: Colours.greenDark,
                  title: const Text("English"),
                  subtitle: Text(
                    "(Phone's Language)",
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                ),
                RadioListTile(
                  value: true,
                  groupValue: false,
                  onChanged: (value) {},
                  activeColor: Colours.greenDark,
                  title: const Text("اردو"),
                  subtitle: Text(
                    "Urdu",
                    style: TextStyle(
                      color: context.theme.greyColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.LangBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.LangBtnHighLightColor,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language,
                color: Colours.greenDark,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "English",
                style: TextStyle(color: Colours.greenDark),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_downward,
                color: Colours.greenDark,
              )
            ],
          ),
        ),
      ),
    );
  }
}
