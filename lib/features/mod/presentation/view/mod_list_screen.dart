import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:minecraft_mod_list/common/l10n/locale_cubit.dart';
import 'package:minecraft_mod_list/common/theme/theme_cubit.dart';
import 'package:minecraft_mod_list/features/mod/presentation/bloc/list/mod_list_cubit.dart';
import 'package:minecraft_mod_list/features/mod/presentation/bloc/list/mod_list_state.dart';
import 'package:minecraft_mod_list/features/mod/presentation/view/widgets/mod_card.dart';
import 'package:minecraft_mod_list/l10n/app_localizations.dart';

/// Главный экран со списком модов и поиском.
class ModListScreen extends StatefulWidget {
  const ModListScreen({super.key});

  @override
  State<ModListScreen> createState() => _ModListScreenState();
}

class _ModListScreenState extends State<ModListScreen> {
  late final TextEditingController _searchController;

  void _initSearchController() {
    final state = context.read<ModListCubit>().state;
    final initialQuery = state is ModListLoaded ? state.searchQuery : '';
    _searchController = TextEditingController(text: initialQuery);
  }

  @override
  void initState() {
    super.initState();
    _initSearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.appTitle,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: l10n.themeToggle,
            icon: Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
          IconButton(
            tooltip: l10n.languageToggle,
            icon: const Icon(Icons.language_rounded),
            onPressed: () => context.read<LocaleCubit>().toggleLocale(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840),
          child: BlocConsumer<ModListCubit, ModListState>(
            listener: (context, state) {
              if (state is ModListLoaded && _searchController.text != state.searchQuery) {
                _searchController.text = state.searchQuery;
              }
            },
            builder: (context, state) {
              return switch (state) {
                ModListLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ModListError(:final message) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          message,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colorScheme.error,
                          ),
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () => context.read<ModListCubit>().load(),
                          child: Text(l10n.retry),
                        ),
                      ],
                    ),
                  ),
                ModListLoaded() => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (query) =>
                              context.read<ModListCubit>().search(query),
                          decoration: InputDecoration(
                            hintText: l10n.searchPlaceholder,
                            prefixIcon: const Icon(Icons.search_rounded),
                            suffixIcon: state.searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear_rounded),
                                    onPressed: () {
                                      _searchController.clear();
                                      context.read<ModListCubit>().search('');
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ),
                      Expanded(
                        child: state.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.search_off_rounded,
                                        size: 64,
                                        color: colorScheme.outline,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        l10n.noModsFound,
                                        style:
                                            theme.textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        l10n.noModsFoundHint,
                                        textAlign: TextAlign.center,
                                        style:
                                            theme.textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.separated(
                                key: const PageStorageKey('mod_list_scroll_key'),
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                itemCount: state.filteredMods.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final mod = state.filteredMods[index];
                                  return ModCard(
                                    mod: mod,
                                    onTap: () => context.push('/mod/${mod.id}'),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
