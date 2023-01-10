import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Corners.smRadius),
          color: Colors.white,
        ),
      );
}
