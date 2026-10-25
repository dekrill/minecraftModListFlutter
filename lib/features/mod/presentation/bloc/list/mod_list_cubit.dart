import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_mod_list/features/mod/domain/i_mod_repository.dart';
import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';
import 'package:minecraft_mod_list/features/mod/presentation/bloc/list/mod_list_state.dart';

/// Cubit управления состоянием экрана списка модов.
class ModListCubit extends Cubit<ModListState> {
  ModListCubit(this._repository) : super(const ModListLoading());

  final IModRepository _repository;

  /// Загрузить начальный список модов
  Future<void> load() async {
    emit(const ModListLoading());
    try {
      final mods = await _repository.getMods();
      emit(ModListLoaded(
        allMods: mods,
        filteredMods: mods,
        searchQuery: '',
      ));
    } catch (e) {
      emit(ModListError(e.toString()));
    }
  }

  /// Фильтрация по поисковому запросу
  void search(String query) {
    final currentState = state;
    if (currentState is! ModListLoaded) return;

    final trimmed = query.trim().toLowerCase();
    final List<ModModel> filtered;
    if (trimmed.isEmpty) {
      filtered = currentState.allMods;
    } else {
      filtered = currentState.allMods.where((mod) {
        final titleMatches = mod.title.toLowerCase().contains(trimmed);
        final descMatches = mod.description.toLowerCase().contains(trimmed);
        final authorMatches = mod.author.toLowerCase().contains(trimmed);
        return titleMatches || descMatches || authorMatches;
      }).toList();
    }

    emit(currentState.copyWith(
      searchQuery: query,
      filteredMods: filtered,
    ));
  }
}
