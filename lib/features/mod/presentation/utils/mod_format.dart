import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';

/// Расширение доменной модели для форматирования полей на экране.
extension ModFormat on ModModel {
  /// Форматированное количество загрузок (в миллионах)
  String get downloadsFormatted {
    final millions = downloads / 1000000.0;
    if (millions >= 1.0) {
      return millions >= 10.0
          ? '${millions.toStringAsFixed(0)}M'
          : '${millions.toStringAsFixed(1)}M';
    }
    final thousands = downloads / 1000.0;
    return '${thousands.toStringAsFixed(0)}k';
  }

  /// Форматированное количество подписчиков (в тысячах)
  String get followsFormatted {
    final thousands = follows / 1000.0;
    return '${thousands.toStringAsFixed(0)}k';
  }

  /// Первая буква для аватара-заглушки
  String get initialLetter =>
      title.isNotEmpty ? title[0].toUpperCase() : 'M';
}
