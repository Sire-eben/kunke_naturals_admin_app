import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';

enum AppbarType {
  light,
  dark,
}

class CustomAppbar extends AppBar {
  CustomAppbar({
    String title = "",
    List<Widget> actions = const [],
    bool showLeading = true,
    double elevation = 0.0,
    AppbarType appbarType = AppbarType.light,
    Key? key,
  }) : super(
          key: key,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: appbarType == AppbarType.light
                  ? AppColors.backgroundDark
                  : AppColors.scaffoldColor,
              fontFamily: Fonts.primary,
            ),
          ),
          backgroundColor: appbarType == AppbarType.light
              ? AppColors.white
              : AppColors.primaryColor,
          leading: showLeading ? _AppbarBackButton(appbarType) : null,
          actions: actions,
          elevation: elevation,
          automaticallyImplyLeading: showLeading,
          centerTitle: false,
        );
}

class _AppbarBackButton extends StatelessWidget {
  final AppbarType appbarType;
  const _AppbarBackButton(this.appbarType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: appbarType == AppbarType.light
              ? AppColors.white
              : AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: LocalSvgIcon(
          Assets.icons.twotone.arrowLeft,
          size: 24,
          color: appbarType == AppbarType.light
              ? AppColors.backgroundDark
              : AppColors.primaryLight,
        ),
      ),
    );
  }
}
