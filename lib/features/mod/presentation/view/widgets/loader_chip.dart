import 'package:flutter/material.dart';
import 'package:minecraft_mod_list/common/theme/app_colors.dart';

/// Компактный чип с названием загрузчика модов.
class LoaderChip extends StatelessWidget {
  const LoaderChip({
    super.key,
    required this.loader,
  });

  final String loader;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.forLoader(loader);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(38),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: color.withAlpha(128),
          width: 1,
        ),
      ),
      child: Text(
        loader,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
