import 'package:flutter/material.dart';
import '../components/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;
  const CustomAppBar({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(texto, style: const TextStyle(color: AppColor.darkViolet)),
      backgroundColor: AppColor.white,
      centerTitle: true,
    );
  }
}
