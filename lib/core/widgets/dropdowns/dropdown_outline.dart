import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:flutter/material.dart';

const dropdownNormalBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Corners.smRadius),
    borderSide: BorderSide(
      width: 0.9,
      color: AppColors.borderColor,
    ));

const dropdownErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Corners.smRadius),
    borderSide: BorderSide(
      width: 0.9,
      color: AppColors.error,
    ));
