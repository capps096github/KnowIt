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

  //
  @override
  void initState() {
    // add listeners ti the spin controller

    super.initState();
  }

  @override
  void dispose() {
    spinController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // wheel colors
    final wheelColors = ref.watch(wheelColorsProvider);

    // random fortune number
    int spinIndex = Fortune.randomInt(0, wheelColors.length);
    //
    // wheel
    return Stack(
      children: [
        // spin wheel
        GestureDetector(
          onTap: () {
            // update the spin controller
            setState(() {
              spinController.add(spinIndex);
            });
            // update the spin index
            spinController.stream.listen((selectedIndex) {
              // update the spin controller
              ref.read(spinIndexProvider.notifier).update((_) => selectedIndex);
            });
          },
          child: FortuneWheel(
            selected: spinController.stream,
            onAnimationEnd: () {
              // update the selected color to the color of the selected index
              // ref
              //     .read(selectedSpinColorProvider.notifier)
              //     .update((_) => wheelColors[spinIndex]);
            },
            onAnimationStart: () {
              // update the selected color to know it color disabled
              // ref
              //     .read(selectedSpinColorProvider.notifier)
              //     .update((_) => knowItBlack.withOpacity(.1));
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

        //  know it logo
        Center(
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
                color: knowItBackgroundColor,
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
      ],
    );
  }
}
