import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../knowit_exporter.dart';
import '../providers.dart';

class GameWheel extends ConsumerStatefulWidget {
  const GameWheel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameWheelState();
}

class _GameWheelState extends ConsumerState<GameWheel> {
  // spiining wheel stream
  StreamController<int> spinController = StreamController<int>();


  @override
  void dispose() {
    spinController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // wheel colors
    final wheelColors = ref.watch(wheelColorsProvider);

    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    //
    // wheel
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          // spin wheel
          GestureDetector(
            onTap: () {
              // random fortune number
              int spinIndex = Fortune.randomInt(0, wheelColors.length);

              // update the spin controller
              setState(() {
                spinController.add(spinIndex);
              });

              // update the color based on the index
              ref
                  .read(selectedSpinColorProvider.notifier)
                  .update((_) => wheelColors[spinIndex]);
            },
            child: Material(
              shape: const CircleBorder(),
              elevation: 20,
              child: FortuneWheel(
                selected: spinController.stream,
                onAnimationEnd: () {
                  // show game tile
                  ref
                      .read(showGameTileProvider.notifier)
                      .update((state) => true);
                },
                onAnimationStart: () {
                  // hide game tile
                  ref
                      .read(showGameTileProvider.notifier)
                      .update((state) => false);
                },
                indicators: const <FortuneIndicator>[
                  // indicator color
                  FortuneIndicator(
                    alignment: Alignment.topCenter,
                    child: TriangleIndicator(color: knowItColor),
                  ),
                ],
                items: List.generate(
                  wheelColors.length,
                  (index) {
                    // wheel color
                    final Color sliceColor = wheelColors[index];

                    return FortuneItem(
                      child: const EmptySpace(),
                      style: FortuneItemStyle(
                        color: sliceColor, // <-- custom circle slice fill color
                        borderColor:
                            sliceColor, // <-- custom circle slice stroke color
                        borderWidth: 3, // <-- custom circle slice stroke width
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          //  know it logo
          GestureDetector(
            onTap: () {
              // random fortune number
              int spinIndex = Fortune.randomInt(0, wheelColors.length);

              // update the spin controller
              setState(() {
                spinController.add(spinIndex);
              });

              // update the color based on the index
              ref
                  .read(selectedSpinColorProvider.notifier)
                  .update((_) => wheelColors[spinIndex]);
            },
            child: Center(
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      knowItColor,
                      knowItTeal,
                    ],
                  ),
                  border: Border.all(
                    color: selectedColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    knowItMiniSvg,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
