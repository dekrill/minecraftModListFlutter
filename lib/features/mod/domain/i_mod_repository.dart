import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';

/// Интерфейс репозитория модов.
abstract interface class IModRepository {
  /// Получить полный список всех модов.
  Future<List<ModModel>> getMods();

  /// Получить информацию о моде по его идентификатору [id].
  Future<ModModel?> getModById(String id);
}
