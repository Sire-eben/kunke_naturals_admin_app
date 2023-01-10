import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style1.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:kunke_naturals_admin_app/presentation/navigation/bottom_navigation.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/context.dart';
import 'package:kunke_naturals_admin_app/presentation/auth/components/auth_components.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmationSuccess extends StatelessWidget {
  final String? image;
  final String? heading;
  final String? subtitle;
  final String? buttonText;

  const ConfirmationSuccess({
    Key? key,
    this.image,
    this.heading,
    this.subtitle,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/login background.png"),
            )),
          ),
          Positioned(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Insets.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      height: screenHeight * .4,
                      image: AssetImage(
                        image ?? Assets.images.leaf.path,
                      )),
                  const Gap(Insets.xl),
                  AuthComponents().compoTexts(
                    context,
                    heading ?? "Congratulations!",
                    subtitle ?? "Your business has been added successfully.",
                  ),
                  const Gap(Insets.xl),
                  ButtonOne(
                      action: () =>
                          context.pushOff(const BottomNavigationScreen()),
                      label: buttonText ?? "Done")
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
