import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';

/// Состояние экрана детальной информации о моде.
sealed class ModDetailState {
  const ModDetailState();
}

/// Загрузка деталей мода
final class ModDetailLoading extends ModDetailState {
  const ModDetailLoading();
}

/// Детали мода успешно загружены
final class ModDetailLoaded extends ModDetailState {
  const ModDetailLoaded(this.mod);

  final ModModel mod;
}

/// Мод с данным id не найден в репозитории
final class ModDetailNotFound extends ModDetailState {
  const ModDetailNotFound(this.id);

  final String id;
}

/// Ошибка при загрузке
final class ModDetailError extends ModDetailState {
  const ModDetailError(this.message);

  final String message;
}
