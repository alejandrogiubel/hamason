import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/ui/common/app_colors.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kcPrimaryGrey,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Assets.searchIcon.svg(),
          hintText: 'Buscar producto',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
