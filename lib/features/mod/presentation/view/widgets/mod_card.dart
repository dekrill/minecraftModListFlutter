import 'package:flutter/material.dart';
import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';
import 'package:minecraft_mod_list/features/mod/presentation/utils/mod_format.dart';
import 'package:minecraft_mod_list/features/mod/presentation/view/widgets/loader_chip.dart';
import 'package:minecraft_mod_list/features/mod/presentation/view/widgets/mod_icon.dart';

/// Карточка мода для списка.
class ModCard extends StatelessWidget {
  const ModCard({
    super.key,
    required this.mod,
    required this.onTap,
  });

  final ModModel mod;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ModIcon(mod: mod, size: 52),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            mod.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.download_rounded,
                              size: 14,
                              color: colorScheme.outline,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              mod.downloadsFormatted,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.outline,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      mod.author,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      mod.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        for (final loader in mod.loaders)
                          LoaderChip(loader: loader),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
