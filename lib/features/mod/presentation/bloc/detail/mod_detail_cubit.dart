import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_mod_list/features/mod/domain/i_mod_repository.dart';
import 'package:minecraft_mod_list/features/mod/presentation/bloc/detail/mod_detail_state.dart';

/// Cubit управления состоянием экрана детальной информации о моде.
class ModDetailCubit extends Cubit<ModDetailState> {
  ModDetailCubit(this._repository) : super(const ModDetailLoading());

  final IModRepository _repository;

  /// Загрузить информацию о моде по [id]
  Future<void> load(String id) async {
    emit(const ModDetailLoading());
    try {
      final mod = await _repository.getModById(id);
      if (mod != null) {
        emit(ModDetailLoaded(mod));
      } else {
        emit(ModDetailNotFound(id));
      }
    } catch (e) {
      emit(ModDetailError(e.toString()));
    }
  }
}
