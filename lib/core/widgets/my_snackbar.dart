import 'package:flutter/material.dart';

SnackBar mySnackbar(String msg) => SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(msg),
      elevation: 1,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.redAccent,
    );
