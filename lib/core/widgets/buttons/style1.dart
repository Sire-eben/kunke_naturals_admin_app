import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final VoidCallback action;
  final String label;
  final Color? btnColor;

  const ButtonOne(
      {Key? key, required this.action, required this.label, this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 57,
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    btnColor ?? AppColors.primaryColor),
                elevation: MaterialStateProperty.all(0)),
            onPressed: action,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w200,
              ),
            )),
      );
}

class LoadingButton extends StatelessWidget {
  final double size;
  final Color? color;

  const LoadingButton({
    this.size = 15,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.borderColor.withOpacity(.2),
        borderRadius: const BorderRadius.all(Corners.smRadius),
      ),
      child: Center(
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: color ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
