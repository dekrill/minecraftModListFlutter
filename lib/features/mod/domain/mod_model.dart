/// Зависимость (связанный мод).
final class ModDependencyModel {
  const ModDependencyModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModDependencyModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => Object.hash(id, name);
}

/// Доменная модель мода Minecraft.
final class ModModel {
  const ModModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.body,
    required this.author,
    required this.iconUrl,
    required this.downloads,
    required this.follows,
    required this.loaders,
    required this.gameVersions,
    this.dependencies = const [],
  });

  final String id;
  final String slug;
  final String title;
  final String description;
  final String body;
  final String author;
  final String iconUrl;
  final int downloads;
  final int follows;
  final List<String> loaders;
  final List<String> gameVersions;
  final List<ModDependencyModel> dependencies;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
