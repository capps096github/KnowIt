import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import '../providers.dart';

class GameTip extends ConsumerWidget {
  const GameTip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    // show game tile
    final showGameTile = ref.watch(showGameTileProvider);

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: Container(
        padding: padding8,
        decoration: BoxDecoration(
          borderRadius: borderRadius6,
          color: selectedColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // game icon
            Icon(
              showGameTile
                  ? CupertinoIcons.hand_draw_fill
                  : CupertinoIcons.asterisk_circle_fill,
              color: knowItWhite,
            ),

            const HorizontalSpace(of: spacing8),

            Flexible(
              child: Text(
                showGameTile ? "Tap the Wheel or Logo to spin" : "Spinning ...",
                style: const TextStyle(
                  fontSize: 16,
                  color: knowItWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
