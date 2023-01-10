import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthComponents {
  Widget compoTexts(BuildContext context, String header, subText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        const Gap(Insets.sm),
        Text(
          subText,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.borderColor,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }

  Widget googleAndFacebook() {
    return Padding(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Or continue with",
              style: TextStyle(
                color: AppColors.borderColor,
                fontSize: 12,
              ),
            ),
          ),
          const Gap(Insets.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(Insets.sm),
                  decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/icons/google.png",
                  )),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFE5E5E5),
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                width: 50,
                child: const Icon(
                  Icons.facebook,
                  size: 30,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
