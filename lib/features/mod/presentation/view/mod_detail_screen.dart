import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:minecraft_mod_list/features/mod/domain/i_mod_repository.dart';
import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';
import 'package:minecraft_mod_list/features/mod/presentation/bloc/detail/mod_detail_cubit.dart';
import 'package:minecraft_mod_list/features/mod/presentation/bloc/detail/mod_detail_state.dart';
import 'package:minecraft_mod_list/features/mod/presentation/utils/mod_format.dart';
import 'package:minecraft_mod_list/features/mod/presentation/view/widgets/loader_chip.dart';
import 'package:minecraft_mod_list/features/mod/presentation/view/widgets/mod_icon.dart';
import 'package:minecraft_mod_list/l10n/app_localizations.dart';

/// Экран детальной информации о моде.
///
/// Экран сам создаёт [ModDetailCubit] через [BlocProvider], получая
/// репозиторий [IModRepository] из контекста ([RepositoryProvider]).
class ModDetailScreen extends StatelessWidget {
  const ModDetailScreen({
    super.key,
    required this.modId,
  });

  final String modId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ModDetailCubit(context.read<IModRepository>())..load(modId),
      child: const _ModDetailView(),
    );
  }
}

class _ModDetailView extends StatelessWidget {
  const _ModDetailView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<ModDetailCubit, ModDetailState>(
      builder: (context, state) {
        return switch (state) {
          ModDetailLoading() => Scaffold(
              appBar: AppBar(
                title: Text(l10n.loading),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ModDetailNotFound() => Scaffold(
              appBar: AppBar(
                title: Text(l10n.modNotFound),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        size: 64,
                        color: colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.modNotFound,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FilledButton.tonal(
                        onPressed: () => context.pop(),
                        child: Text(l10n.actionBack),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ModDetailError(:final message) => Scaffold(
              appBar: AppBar(
                title: Text(l10n.appTitle),
              ),
              body: Center(
                child: Text(
                  message,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.error,
                  ),
                ),
              ),
            ),
          ModDetailLoaded(:final mod) => Scaffold(
              appBar: AppBar(
                title: Text(
                  mod.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context, theme, mod),
                    const SizedBox(height: 16),
                    _buildStatsCard(context, theme, mod, l10n),
                    const SizedBox(height: 20),
                    _buildSectionTitle(theme, l10n.supportedLoaders),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final loader in mod.loaders)
                          LoaderChip(loader: loader),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle(theme, l10n.gameVersions),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final version in mod.gameVersions)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              version,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (mod.dependencies.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      _buildSectionTitle(theme, l10n.dependencies),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final dep in mod.dependencies)
                            ActionChip(
                              avatar: const Icon(
                                Icons.link_rounded,
                                size: 16,
                              ),
                              label: Text(dep.name),
                              onPressed: () => context.push('/mod/${dep.id}'),
                            ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),
                    _buildSectionTitle(theme, l10n.about),
                    const SizedBox(height: 8),
                    Text(
                      mod.body,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
        };
      },
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme, ModModel mod) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ModIcon(mod: mod, size: 68),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mod.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                mod.author,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCard(
    BuildContext context,
    ThemeData theme,
    ModModel mod,
    AppLocalizations l10n,
  ) {
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  l10n.downloadsLabel,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mod.downloadsFormatted,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Container(
              height: 36,
              width: 1,
              color: colorScheme.outlineVariant,
            ),
            Column(
              children: [
                Text(
                  l10n.followersLabel,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mod.followsFormatted,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
