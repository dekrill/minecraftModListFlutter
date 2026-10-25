import 'package:flutter/material.dart';
import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';
import 'package:minecraft_mod_list/features/mod/presentation/utils/mod_format.dart';

/// Иконка мода с поддержкой асинхронной загрузки и fallback-заглушки.
class ModIcon extends StatelessWidget {
  const ModIcon({
    super.key,
    required this.mod,
    this.size = 48,
  });

  final ModModel mod;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(size * 0.2);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: size,
        height: size,
        color: theme.colorScheme.primaryContainer,
        child: Image.network(
          mod.iconUrl,
          fit: BoxFit.cover,
          width: size,
          height: size,
          errorBuilder: (context, error, stackTrace) =>
              _buildFallback(theme),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildFallback(theme);
          },
        ),
      ),
    );
  }

  Widget _buildFallback(ThemeData theme) {
    return Center(
      child: Text(
        mod.initialLetter,
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: size * 0.45,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
