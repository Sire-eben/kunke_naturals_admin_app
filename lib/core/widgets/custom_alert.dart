import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';

class CustomAlert extends StatelessWidget {
  final String title, content;
  final VoidCallback action;

  const CustomAlert(
      {Key? key,
      required this.title,
      required this.content,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        titleTextStyle:
            const TextStyle(color: AppColors.borderColor, fontSize: 21),
        contentTextStyle: const TextStyle(color: AppColors.borderColor),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "No",
                style: TextStyle(color: AppColors.error),
              )),
          TextButton(onPressed: action, child: const Text("Yes")),
        ],
      );
}
