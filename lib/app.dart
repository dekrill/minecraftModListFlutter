import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_mod_list/common/l10n/locale_cubit.dart';
import 'package:minecraft_mod_list/common/navigation/app_router.dart';
import 'package:minecraft_mod_list/common/theme/app_theme.dart';
import 'package:minecraft_mod_list/common/theme/theme_cubit.dart';
import 'package:minecraft_mod_list/features/mod/data/mod_repository.dart';
import 'package:minecraft_mod_list/features/mod/domain/i_mod_repository.dart';
import 'package:minecraft_mod_list/features/mod/presentation/bloc/list/mod_list_cubit.dart';
import 'package:minecraft_mod_list/l10n/app_localizations.dart';

/// Корневой виджет приложения Minecraft Mod List.
///
/// Регистрирует зависимости через [RepositoryProvider] и глобальные
/// кубиты (тема, локаль, список) через [MultiBlocProvider].
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IModRepository>(
      create: (context) => const ModRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<LocaleCubit>(
            create: (context) => LocaleCubit(),
          ),
          BlocProvider<ModListCubit>(
            create: (context) =>
                ModListCubit(context.read<IModRepository>())..load(),
          ),
        ],
        child: const _AppView(),
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LocaleCubit>().state;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.router,
    );
  }
}
