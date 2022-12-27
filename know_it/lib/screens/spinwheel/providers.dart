import '../../knowit_exporter.dart';

final spinIndexProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

/// selected color provider based on index of the spin wheel
final selectedSpinColorProvider = StateProvider<Color>(
  (ref) {
    final wheelColors = ref.watch(wheelColorsProvider);
    final selectedColorIndex = ref.watch(spinIndexProvider);

    return wheelColors[selectedColorIndex];
  },
);

// show game tile
final showGameTileProvider = StateProvider<bool>(
  (ref) {
    return true;
  },
);


// wheel colors
final wheelColorsProvider = Provider<List<Color>>(
  (ref) {
    return const [
      knowItTeal,
      knowItOrange,
      knowItBlack,
      Color(0xFFFF0000),
      Color(0xFF228B22),
      Color(0xFFF8074B),
      Color(0xFFFF6F00),
      Color(0xFF90A4AE),
      Color(0xFFE65100),
      Color(0xFF800000),
    ];
  },
);
