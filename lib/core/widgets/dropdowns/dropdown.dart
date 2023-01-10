// import 'package:buuka/generated/assets.gen.dart';
// import 'package:buuka/image.dart';
// import 'package:flutter/material.dart';

// import 'buildmenuitem.dart';

// class CustomDropDown extends StatefulWidget {
//   final String valueString, hint, disabledHint;
//   final Function(String input)? onChanged;
//   final VoidCallback? action;
//   final Function(String?)? onSaved;

//   const CustomDropDown(
//       {Key? key,
//       required this.valueString,
//       required this.hint,
//       required this.disabledHint,
//       this.onChanged,
//       this.action,
//       this.onSaved})
//       : super(key: key);

//   @override
//   State<CustomDropDown> createState() => _CustomDropDownState();
// }

// class _CustomDropDownState extends State<CustomDropDown> {
//   @override
//   Widget build(BuildContext context) => DropdownButtonFormField<String>(
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Select One Option';
//           }
//           return null;
//         },
//         hint: const Text('Select'),
//         disabledHint: const Text('Select'),
//         decoration: InputDecoration(
//           prefixIcon: LocalSvgIcon(
//             Assets.icons.bulk.activity,
//             size: 16,
//           ),
//         ),
//         value: valueString,
//         isExpanded: true,
//         items: purpose.map(buildMenuItem).toList(),
//         onChanged: onChanged,
//       );
// }
