import 'package:flutter/material.dart';
import '../components/colors.dart';

InputDecoration inputdecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: const TextStyle(color: AppColor.graphite),
    enabledBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: AppColor.graphite),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: AppColor.violet, width: 2),
    ),
  );
}
