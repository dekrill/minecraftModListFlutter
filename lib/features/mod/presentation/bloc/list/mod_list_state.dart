import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';

/// Состояние экрана списка модов.
sealed class ModListState {
  const ModListState();
}

/// Загрузка данных списка
final class ModListLoading extends ModListState {
  const ModListLoading();
}

/// Список успешно загружен
final class ModListLoaded extends ModListState {
  const ModListLoaded({
    required this.allMods,
    required this.filteredMods,
    this.searchQuery = '',
  });

  final List<ModModel> allMods;
  final List<ModModel> filteredMods;
  final String searchQuery;

  bool get isEmpty => filteredMods.isEmpty;

  ModListLoaded copyWith({
    List<ModModel>? allMods,
    List<ModModel>? filteredMods,
    String? searchQuery,
  }) {
    return ModListLoaded(
      allMods: allMods ?? this.allMods,
      filteredMods: filteredMods ?? this.filteredMods,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

/// Ошибка загрузки списка
final class ModListError extends ModListState {
  const ModListError(this.message);

  final String message;
}
