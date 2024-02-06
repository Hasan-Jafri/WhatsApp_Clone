import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';
import 'package:whatsapp_clone/common/widgets/custm_text_field.dart';
import 'package:whatsapp_clone/common/widgets/custom_elevated_button.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_clone/features/welcome/auth/controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryCodeController;
  late TextEditingController countrynameController;
  late TextEditingController phoneNumberController;

  sendCodetoPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryName = countrynameController.text;
    final countryCode = countryCodeController.text;

    if (phoneNumber.isEmpty) {
      return showAlertDialog(
        context: context,
        message: "Please enter your phone number",
      );
    } else if (phoneNumber.length < 9) {
      return showAlertDialog(
          context: context,
          message:
              "The phone number you entered is too short for the country: $countryName.\n\nInclude your area code if you haven't");
    } else if (phoneNumber.length > 10) {
      return showAlertDialog(
        context: context,
        message:
            "The number you entered is too long for the country: $countryName",
      );
    } // request a verification code.
    ref.read(authControllerProvider).sendSmsCode(
          context: context,
          phoneNumber: '+$countryCode$phoneNumber',
        );
  }

  showCntryCodePicker() {
    showCountryPicker(
      context: context,
      onSelect: (country) {
        countrynameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
      showPhoneCode: true,
      favorite: ["PK"],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).colorScheme.background,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(
          color: context.theme.greyColor,
        ),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: Colours.greenDark,
          ),
          hintText: 'Search country code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(0.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colours.greenDark,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    countryCodeController = TextEditingController(text: "92");
    countrynameController = TextEditingController(text: "Pakistan");
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    countrynameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "WhatsApp will need to verify your phone number. ",
                style: TextStyle(
                  color: context.theme.greyColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "What's my number?",
                    style: TextStyle(
                      color: context.theme.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              controller: countrynameController,
              onTap: () {},
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colours.greenDark,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: () => showCntryCodePicker(),
                    controller: countryCodeController,
                    prefixText: "+",
                    readOnly: true,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    onTap: () => showCntryCodePicker(),
                    hintText: "phone number",
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Carrier charges may apply",
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodetoPhone,
        text: "NEXT",
        buttonWidth: 90,
      ),
    );
  }
}
