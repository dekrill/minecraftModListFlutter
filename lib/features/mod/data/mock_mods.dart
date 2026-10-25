import 'package:minecraft_mod_list/features/mod/domain/mod_model.dart';

const List<ModModel> mockMods = [
  ModModel(
    id: 'P7dR8mSH',
    slug: 'fabric-api',
    title: 'Fabric API',
    description:
        'Core library inter-mod compatibility hooks for the Fabric toolchain.',
    body:
        'Fabric API is the library for essential hooks and inter-compatibility between mods utilizing the Fabric loader. It provides standard hooks for rendering, registries, networking, and item groups.',
    author: 'FabricMC',
    iconUrl: 'https://cdn.modrinth.com/data/P7dR8mSH/icon.png',
    downloads: 85400000,
    follows: 120000,
    loaders: ['fabric', 'quilt'],
    gameVersions: ['1.21.4', '1.21.3', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [],
  ),
  ModModel(
    id: 'AANobbMI',
    slug: 'sodium',
    title: 'Sodium',
    description:
        'A modern rendering engine and client-side performance mod for Minecraft.',
    body:
        'Sodium is a free and open-source rendering engine replacement for the Minecraft client which greatly improves frame rates, reduces micro-stutter, and fixes many graphical issues in Minecraft.',
    author: 'jellysquid3',
    iconUrl:
        'https://cdn.modrinth.com/data/AANobbMI/295862f4724dc3f78df3447ad6072b2dcd3ef0c9_96.webp',
    downloads: 45200000,
    follows: 98000,
    loaders: ['fabric', 'quilt', 'neoforge'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'YL57xq9U',
    slug: 'iris',
    title: 'Iris Shaders',
    description: 'A modern shaders mod for Minecraft compatible with Sodium.',
    body:
        'Iris is a modern shader mod for Minecraft intended to be compatible with the existing OptiFine shader pack ecosystem, while also providing high performance through tight integration with Sodium.',
    author: 'coderbot',
    iconUrl:
        'https://cdn.modrinth.com/data/YL57xq9U/18d0e7f076d3d6ed5bedd472b853909aac5da202_96.webp',
    downloads: 32100000,
    follows: 76000,
    loaders: ['fabric', 'quilt', 'neoforge'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'AANobbMI', name: 'Sodium'),
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'uXXizFIs',
    slug: 'ferrite-core',
    title: 'FerriteCore',
    description: 'Memory usage optimizations for Minecraft.',
    body:
        'FerriteCore reduces the memory usage of Minecraft in a few different ways, saving hundreds of megabytes of RAM especially in large modpacks.',
    author: 'malte0811',
    iconUrl:
        'https://cdn.modrinth.com/data/uXXizFIs/222a126f26f8f9ae1eb339f3b767677f18bff31f_96.webp',
    downloads: 28900000,
    follows: 45000,
    loaders: ['fabric', 'forge', 'neoforge', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.1', '1.19.2'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'hvFnDODq',
    slug: 'lithium',
    title: 'Lithium',
    description: 'No-compromises game physics / world-gen optimization mod.',
    body:
        'Lithium is a general-purpose optimization mod for Minecraft which works to improve the game physics, mob AI, and world generation code without changing vanilla mechanics.',
    author: 'jellysquid3',
    iconUrl:
        'https://cdn.modrinth.com/data/gvQqBUqZ/bcc8686c13af0143adf4285d741256af824f70b7_96.webp',
    downloads: 26500000,
    follows: 52000,
    loaders: ['fabric', 'quilt', 'neoforge'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'gvQqBUqZ',
    slug: 'cloth-config',
    title: 'Cloth Config v15',
    description: 'Config API for Fabric and Forge.',
    body:
        'Cloth Config is a client-sided configuration screen library built to assist mod developers in creating visually consistent in-game configurations.',
    author: 'shedaniel',
    iconUrl:
        'https://cdn.modrinth.com/data/9s6osm5g/ed8a2316cbb6f4fc5f510e8e13a59a85cbbbff4d_96.webp',
    downloads: 41200000,
    follows: 31000,
    loaders: ['fabric', 'forge', 'neoforge', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'mOgUt4GM',
    slug: 'modmenu',
    title: 'Mod Menu',
    description:
        'Adds a mod list screen to view installed mods and configure them.',
    body:
        'Mod Menu adds a screen for viewing a list of installed mods, searching them, and opening their configuration screens if supported.',
    author: 'TerraformersMC',
    iconUrl:
        'https://cdn.modrinth.com/data/mOgUt4GM/5a20ed1450a0e1e79a1fe04e61bb4e5878bf1d20.png',
    downloads: 39800000,
    follows: 61000,
    loaders: ['fabric', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'fALMmOf8',
    slug: 'roughly-enough-items',
    title: 'Roughly Enough Items (REI)',
    description: 'Clean and customizable recipe and item viewer mod.',
    body:
        'Roughly Enough Items is a recipe viewer mod for Fabric, Forge, and NeoForge with deep mod compatibility, bookmarks, and search filtering.',
    author: 'shedaniel',
    iconUrl:
        'https://cdn.modrinth.com/data/nfn13YXA/54ac5daa4166011bae713448e84413987316433a_96.webp',
    downloads: 24100000,
    follows: 43000,
    loaders: ['fabric', 'forge', 'neoforge', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'gvQqBUqZ', name: 'Cloth Config v15'),
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'u6dDxUnF',
    slug: 'jei',
    title: 'Just Enough Items (JEI)',
    description: 'View Items and Recipes in Minecraft.',
    body:
        'JEI is an item and recipe viewing mod for Minecraft, built from the ground up for stability and performance.',
    author: 'mezz',
    iconUrl:
        'https://cdn.modrinth.com/data/u6dRKJwZ/4a3f18ac0d096c9f8e9176984c44be4e58f94c89_96.webp',
    downloads: 38500000,
    follows: 59000,
    loaders: ['forge', 'neoforge', 'fabric'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [],
  ),
  ModModel(
    id: 'LNytGWDc',
    slug: 'create',
    title: 'Create',
    description: 'Building, Decoration and Aesthetic Automation.',
    body:
        'Welcome to Create, a mod offering a variety of tools and blocks for Building, Decoration and Aesthetic Automation utilizing kinetic energy.',
    author: 'simibubi',
    iconUrl:
        'https://cdn.modrinth.com/data/LNytGWDc/61d716699bcf1ec42ed4926a9e1c7311be6087e2_96.webp',
    downloads: 19400000,
    follows: 89000,
    loaders: ['forge', 'neoforge', 'fabric'],
    gameVersions: ['1.20.1', '1.19.2', '1.18.2'],
    dependencies: [],
  ),
  ModModel(
    id: 'EsAfCjCV',
    slug: 'appleskin',
    title: 'AppleSkin',
    description: 'Food and hunger HUD improvements for Minecraft.',
    body:
        'AppleSkin provides useful information about food and hunger mechanics on the player HUD, showing saturation and potential exhaustion preview.',
    author: 'squeek502',
    iconUrl: 'https://cdn.modrinth.com/data/EsAfCjCV/icon.png',
    downloads: 34500000,
    follows: 41000,
    loaders: ['fabric', 'forge', 'neoforge', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [],
  ),
  ModModel(
    id: 'kkmrDlKT',
    slug: 'zoomify',
    title: 'Zoomify',
    description:
        'A zoom mod with infinite customizability and smooth animations.',
    body:
        'Zoomify provides a cinematic, configurable zoom key with secondary zoom scroll wheel adjustments and transitions.',
    author: 'isxander',
    iconUrl:
        'https://cdn.modrinth.com/data/w7ThoJFB/e2de67a0bfb9e8aa2347982ab3ec5463f26cca31_96.webp',
    downloads: 15200000,
    follows: 28000,
    loaders: ['fabric', 'quilt', 'neoforge'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: '51shyZVL',
    slug: 'entityculling',
    title: 'Entity Culling',
    description:
        'Using async path tracing to skip rendering blocked entities and block entities.',
    body:
        'Entity Culling skips rendering entities and tile entities that are hidden behind solid opaque blocks, saving significant rendering time.',
    author: 'tr9zw',
    iconUrl:
        'https://cdn.modrinth.com/data/NNAgCjsB/7873452d6cede4daed12da3d7d8c193ab88b4fd6_96.webp',
    downloads: 18700000,
    follows: 33000,
    loaders: ['fabric', 'forge', 'neoforge', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [],
  ),
  ModModel(
    id: 'Ha28R6CL',
    slug: 'yet-another-config-lib',
    title: 'YetAnotherConfigLib (YACL)',
    description:
        'A builder-based configuration library for Minecraft mod developers.',
    body:
        'YetAnotherConfigLib provides clean and stylish GUI screens for mod options, offering great controller and keyboard accessibility.',
    author: 'isxander',
    iconUrl:
        'https://cdn.modrinth.com/data/1eAoo2KR/08c0cd32515e260f4bb20bbc0696510041523f9a_96.webp',
    downloads: 16800000,
    follows: 19000,
    loaders: ['fabric', 'quilt', 'neoforge'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'Orvt0mRa',
    slug: 'indium',
    title: 'Indium',
    description:
        'Sodium addon providing support for the Fabric Rendering API (FREX/FRAPI).',
    body:
        'Indium implements the Fabric Rendering API for Sodium, enabling compatibility with mods like Continuity, Bits and Chisels, and Campanion.',
    author: 'comp500',
    iconUrl:
        'https://cdn.modrinth.com/data/Orvt0mRa/13f4ab01fac350702ba20871c9f964064073a5e2_96.webp',
    downloads: 21400000,
    follows: 37000,
    loaders: ['fabric', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'AANobbMI', name: 'Sodium'),
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: '1bokaNcj',
    slug: 'continuity',
    title: 'Continuity',
    description: 'Connected textures mod for Fabric, Quilt, and NeoForge.',
    body:
        'Continuity is a mod built designed to provide connected textures, emissive textures, and other visual embellishments using standard resource pack formats.',
    author: 'PepperCode1',
    iconUrl: 'https://cdn.modrinth.com/data/1IjD5062/icon.png',
    downloads: 12900000,
    follows: 32000,
    loaders: ['fabric', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'Orvt0mRa', name: 'Indium'),
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'NNAgCjsB',
    slug: 'dynamic-fps',
    title: 'Dynamic FPS',
    description:
        'Reduce resource usage when the game is in the background or idle.',
    body:
        'Dynamic FPS automatically throttles frame rate and disables sound processing when Minecraft window is not focused or minimized, saving power and CPU/GPU usage.',
    author: 'juliand665',
    iconUrl:
        'https://cdn.modrinth.com/data/LQ3K71Q1/5056368d0d87c1a9f3efead0cb48ab39a4ea87bf_96.webp',
    downloads: 14300000,
    follows: 24000,
    loaders: ['fabric', 'quilt', 'forge', 'neoforge'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'gvQqBUqZ', name: 'Cloth Config v15'),
    ],
  ),
  ModModel(
    id: 'Bh37bMuy',
    slug: 'distanthorizons',
    title: 'Distant Horizons',
    description:
        'Level of Detail (LOD) mod to view distant terrain beyond render distance.',
    body:
        'Distant Horizons renders simplified terrain at extreme distances without crippling CPU and GPU performance, enabling draw distances up to hundreds of chunks.',
    author: 'James_Seibel',
    iconUrl:
        'https://cdn.modrinth.com/data/uCdwusMi/e716cda9bb568b5373ff76e363fb4c6d7278fba6_96.webp',
    downloads: 9800000,
    follows: 49000,
    loaders: ['fabric', 'forge', 'neoforge'],
    gameVersions: ['1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: '7b2U2j4x',
    slug: 'architectury-api',
    title: 'Architectury API',
    description:
        'An intermediary API facilitating cross-platform mod development.',
    body:
        'Architectury API is an abstraction layer that makes it easy for mod developers to support both Fabric and Forge/NeoForge mod loaders with a unified codebase.',
    author: 'shedaniel',
    iconUrl:
        'https://cdn.modrinth.com/data/lhGA9TYQ/05fe3a61c28faaccaec3533b92e1b321edde7bf6_96.webp',
    downloads: 37100000,
    follows: 30000,
    loaders: ['fabric', 'forge', 'neoforge', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [],
  ),
  ModModel(
    id: 'H8CaAYZC',
    slug: 'falling-leaves',
    title: 'Falling Leaves',
    description:
        'Adds neat little falling leaf particles beneath trees and bushes.',
    body:
        'Falling Leaves adds subtle cosmetic leaf particles that gently fall from tree foliage blocks, creating a cozy and atmospheric forest environment.',
    author: 'RandomMcSomethin',
    iconUrl:
        'https://cdn.modrinth.com/data/ALTwwcC5/b058e8747e78c2540d232e57f32be2558d5d8edb_96.webp',
    downloads: 8900000,
    follows: 21000,
    loaders: ['fabric', 'quilt', 'neoforge'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [
      ModDependencyModel(id: 'gvQqBUqZ', name: 'Cloth Config v15'),
      ModDependencyModel(id: 'P7dR8mSH', name: 'Fabric API'),
    ],
  ),
  ModModel(
    id: 'MPCX6s5C',
    slug: 'xaeros-minimap',
    title: "Xaero's Minimap",
    description:
        'Displays a smooth, customizable mini-map of the nearby world.',
    body:
        "Xaero's Minimap provides a clean and highly customizable radar on your screen, featuring waypoints, cave mode, and entity radar.",
    author: 'xaero96',
    iconUrl:
        'https://cdn.modrinth.com/data/1bokaNcj/354080f65407e49f486fcf9c4580e82c45ae63b8_96.webp',
    downloads: 17600000,
    follows: 35000,
    loaders: ['fabric', 'forge', 'neoforge', 'quilt'],
    gameVersions: ['1.21.4', '1.21.1', '1.20.4', '1.20.1'],
    dependencies: [],
  ),
];
