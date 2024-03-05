// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:gadgetku/common/textstyle.dart';

class CupertinoTextFieldWidget extends StatelessWidget {
  CupertinoTextFieldWidget({
    super.key,
    this.placeHolder,
    this.controller,
    this.isObsecure,
    this.suffix,
    this.label,
  });

  String? placeHolder;
  TextEditingController? controller;
  bool? isObsecure;
  Widget? suffix;
  String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: poppins(16.5, FontWeight.w400),
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          controller: controller,
          placeholder: placeHolder,
          obscureText: isObsecure ?? false,
          style: const TextStyle(fontWeight: FontWeight.w500),
          autocorrect: false,
          suffix: suffix,
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: CupertinoColors.white,
          ),
        ),
      ],
    );
  }
}
