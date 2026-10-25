import 'package:flutter/material.dart';

/// Цветовые константы приложения.
abstract final class AppColors {
  /// Базовый опорный цвет темы (Minecraft green)
  static const Color seed = Color(0xFF2E7D32);

  /// Цвета для тегов загрузчиков модов
  static const Color loaderFabric = Color(0xFF388E3C);
  static const Color loaderForge = Color(0xFFD87C2A);
  static const Color loaderNeoForge = Color(0xFFE65100);
  static const Color loaderQuilt = Color(0xFF7B1FA2);
  static const Color loaderDefault = Color(0xFF546E7A);

  /// Получить цвет для конкретного лоадера
  static Color forLoader(String loader) {
    switch (loader.toLowerCase()) {
      case 'fabric':
        return loaderFabric;
      case 'forge':
        return loaderForge;
      case 'neoforge':
        return loaderNeoForge;
      case 'quilt':
        return loaderQuilt;
      default:
        return loaderDefault;
    }
  }
}
