import 'package:flutter/material.dart';
import '../components/colors.dart';

InputDecoration inputdecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: const TextStyle(color: AppColor.graphite),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.graphite),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.violet, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
