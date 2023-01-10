import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:flutter/material.dart';

class ButtonTwo extends StatelessWidget {
  final VoidCallback action;
  final String label;

  const ButtonTwo({Key? key, required this.action, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 57,
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        color: AppColors.primaryColor, width: 1))),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0.0)),
            onPressed: action,
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w200,
              ),
            )),
      );
}
