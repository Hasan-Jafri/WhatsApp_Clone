import "package:flutter/material.dart";
import "package:whatsapp_clone/common/extension/custom_theme_extension.dart";
import "package:whatsapp_clone/common/routes/routes.dart";
import "package:whatsapp_clone/common/widgets/custom_elevated_button.dart";
import "package:whatsapp_clone/features/welcome/widgets/language_button.dart";
import "package:whatsapp_clone/features/welcome/widgets/terms_and_conditions.dart";

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  navigateToLoginPage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Image.asset(
                'assets/images/circle.png',
                color: context.theme.CircleImageColor,
              ),
            ),
          )),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Welcome To WhatsApp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const PrivacyAndTerms(),
                CustomElevatedButton(
                  text: "AGREE AND CONTINUE",
                  onPressed: () => navigateToLoginPage(context),
                ),
                const SizedBox(
                  height: 40,
                ),
                const LanguageButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
