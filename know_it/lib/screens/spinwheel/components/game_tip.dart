import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import '../providers.dart';

class GameTip extends ConsumerWidget {
  const GameTip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    // // show game tile
    // final showGameTile = ref.watch(showGameTileProvider);

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
          children: const [
            // game icon
            Icon(
              CupertinoIcons.hand_draw_fill,
              color: knowItWhite,
            ),

            HorizontalSpace(of: spacing8),

            Flexible(
              child: Text(
                "Tap the Wheel or Logo to spin",
                style: TextStyle(
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
