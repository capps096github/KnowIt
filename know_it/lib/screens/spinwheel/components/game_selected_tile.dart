import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import '../providers.dart';

class GameSelectedTile extends ConsumerWidget {
  const GameSelectedTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    return Padding(
      padding: padding8,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // game selected container
          Container(
            width: double.infinity,
            padding: padding16,
            decoration: BoxDecoration(
              borderRadius: borderRadius8,
              color: selectedColor.withOpacity(.15),
              border: Border.all(
                color: selectedColor,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // text
                Flexible(
                  child: Text(
                    "How to use a Condom correctly",
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const HorizontalSpace(of: spacing8),
                // icon
                Icon(
                  CupertinoIcons.arrow_up_right_circle_fill,
                  color: selectedColor,
                ),
              ],
            ),
          ),

          // play now
          Positioned(
            top: -spacing16,
            left: spacing16,
            child: Container(
              padding: padding8,
              decoration: BoxDecoration(
                borderRadius: borderRadius6,
                color: selectedColor,
              ),
              child: Center(
                child: Row(
                  children: const [
                    // game icon
                    Icon(
                      CupertinoIcons.game_controller_solid,
                      color: knowItWhite,
                      size: 12,
                    ),

                    HorizontalSpace(of: spacing8),

                    //
                    Text(
                      "Play Now",
                      style: TextStyle(
                        color: knowItWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
