import 'package:minecraft_mod_list/features/mod/data/mock_mods.dart';
import 'package:minecraft_mod_list/features/mod/domain/i_mod_repository.dart';
import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';

/// Реализация репозитория модов на моковых данных.
///
/// В ЛР3 вместо моков будет сетевой источник данных, при этом
/// интерфейс [IModRepository] и доменная модель останутся неизменными.
final class ModRepository implements IModRepository {
  const ModRepository();

  @override
  Future<List<ModModel>> getMods() async {
    // Небольшая задержка для симуляции асинхронного источника данных
    return Future.value(mockMods);
  }

  @override
  Future<ModModel?> getModById(String id) async {
    for (final mod in mockMods) {
      if (mod.id == id) {
        return Future.value(mod);
      }
    }
    return Future.value(null);
  }
}
