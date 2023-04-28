import 'package:flutter/material.dart';
import 'package:hamason/core/gen/assets.gen.dart';
import 'package:hamason/core/utils/string_extensions.dart';

class BottomHomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const BottomHomeAppBar({
    super.key,
    required this.productsCategories,
  });
  final List<String> productsCategories;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Row(
        children: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Assets.filter.svg(),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Todos'.capitalize()),
                ),
                ...productsCategories
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(e.replaceAll('-', ' ').capitalize()),
                        ))
                    .toList(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
