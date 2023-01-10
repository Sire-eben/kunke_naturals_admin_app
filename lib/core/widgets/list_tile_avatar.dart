import 'dart:math';

import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ListTileAvatar extends StatelessWidget {
  final String text;

  const ListTileAvatar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(
          Random().nextInt(127),
          Random().nextInt(127),
          Random().nextInt(127),
          Random().nextInt(255),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        text.getInitials(),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }
}
