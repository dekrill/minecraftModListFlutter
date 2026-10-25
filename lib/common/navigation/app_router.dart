import 'package:go_router/go_router.dart';
import 'package:minecraft_mod_list/features/mod/presentation/view/mod_detail_screen.dart';
import 'package:minecraft_mod_list/features/mod/presentation/view/mod_list_screen.dart';

/// Конфигурация маршрутизации приложения на базе [GoRouter].
///
/// В роутере Bloc/Cubit не создаются — экраны создают свои Cubit сами
/// либо получают их из корневого дерева через [MultiBlocProvider].
abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ModListScreen(),
        routes: [
          GoRoute(
            path: 'mod/:id',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return ModDetailScreen(modId: id);
            },
          ),
        ],
      ),
    ],
  );
}
