import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit управления языком интерфейса (ru/en).
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ru'));

  /// Переключить между русским и английским языком
  void toggleLocale() {
    emit(state.languageCode == 'ru' ? const Locale('en') : const Locale('ru'));
  }

  void setLocale(Locale locale) {
    emit(locale);
  }
}
