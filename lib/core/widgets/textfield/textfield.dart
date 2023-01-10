import 'package:gap/gap.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/text_input.dart';
import 'package:kunke_naturals_admin_app/core/utils/validators.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';

class TextInputField extends StatelessWidget {
  final String? labelText, prefixText;
  final String? initialValue;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final String? Function(String? input)? validator;
  final Function(String input)? onChanged;
  final VoidCallback? action;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final FocusNode? focusNode;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool enabled;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? suffixText;
  final InputDecoration? decoration;
  final AutovalidateMode? autovalidateMode;
  //final AutofillHints? autofillHints;

  const TextInputField({
    Key? key,
    this.labelText,
    this.prefixText,
    this.initialValue,
    this.style,
    this.suffixIcon,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.labelStyle,
    this.hintStyle,
    this.suffixText,
    this.decoration,
    this.autovalidateMode,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Corners.smRadius),
      borderSide: BorderSide(
        color: AppColors.borderColor,
        width: 0.9,
      ),
    );

    final outlineInputErrorBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Corners.mdRadius),
      borderSide: outlineInputBorder.borderSide.copyWith(
        color: AppColors.error,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(labelText!, style: const TextStyle(fontSize: 13)),
          const Gap(4),
        ],
        TextFormField(
          readOnly: readOnly,
          onTap: action,
          controller: controller,
          onSaved: (input) => onSaved?.call((input ?? "").trim()),
          autovalidateMode: autovalidateMode,
          obscureText: obscureText,
          maxLines: maxLines,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          keyboardType: inputType,
          enabled: enabled,
          onChanged: onChanged,
          validator: validator,
          style: style,
          decoration: decoration ??
              InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: Insets.md),
                suffixText: suffixText,
                prefixText: prefixText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: hintText,
                // labelText: labelText,
                floatingLabelStyle: labelStyle ??
                    const TextStyle(
                        color: Colors.black45,
                        fontSize: FontSizes.sm,
                        fontWeight: FontWeight.w400),
                labelStyle: labelStyle ??
                    const TextStyle(
                        color: AppColors.backgroundDark,
                        fontSize: FontSizes.sm,
                        fontWeight: FontWeight.w400),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                hintStyle: hintStyle ??
                    const TextStyle(
                        color: AppColors.backgroundDark,
                        fontSize: FontSizes.sm,
                        fontWeight: FontWeight.w200),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Corners.smRadius),
                    borderSide: BorderSide(color: AppColors.borderColor)),
                focusedBorder: outlineInputBorder,
                errorBorder: outlineInputErrorBorder,
                focusedErrorBorder: outlineInputErrorBorder,
                disabledBorder: outlineInputBorder.copyWith(
                  borderSide: outlineInputBorder.borderSide.copyWith(
                    color: AppColors.backgroundDark,
                  ),
                ),
              ),
        ),
      ],
    );
  }
}

class PhoneNumberTextInputField extends StatefulWidget {
  final String? labelText;
  final PhoneNumber? initialValue;
  final Function(String input)? onChanged;
  final Function(PhoneNumber?)? onSaved;
  final FocusNode? focusNode;
  final String? hintText;
  final TextEditingController? controller;
  final bool enabled;
  final TextStyle? labelStyle, style;

  const PhoneNumberTextInputField({
    Key? key,
    this.labelText,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.hintText,
    this.controller,
    this.labelStyle,
    this.style,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<PhoneNumberTextInputField> createState() =>
      _PhoneNumberTextInputFieldState();
}

class _PhoneNumberTextInputFieldState extends State<PhoneNumberTextInputField> {
  late PhoneNumberCountry phoneNumberCountry;

  @override
  void initState() {
    super.initState();
    phoneNumberCountry = phoneNumberCountryList()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputField(
          style: widget.style,
          prefixIcon: SizedBox(
              width: 44,
              child: Center(
                child: LocalSvgImage(phoneNumberCountry.flag),
              )),
          labelText: widget.labelText ?? "Phone Number",
          hintText: widget.hintText ?? "Enter your phone number",
          initialValue: widget.initialValue?.number,
          inputType: TextInputType.number,
          onChanged: widget.onChanged,
          onSaved: (input) => widget.onSaved?.call(
            PhoneNumber(
              number: "$input",
              dialCode: phoneNumberCountry.countryCode,
            ),
          ),
          validator: (input) => Validators.validatePhoneNumber(
              maxLength: phoneNumberCountry.maxLength)(input),
          inputFormatters: [
            LengthLimitingTextInputFormatter(phoneNumberCountry.maxLength),
            FilteringTextInputFormatter.digitsOnly,
          ],
          focusNode: widget.focusNode,
          controller: widget.controller,
          enabled: widget.enabled,
          labelStyle: widget.labelStyle,
        ),
      ],
    );
  }
}
