import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../knowit_exporter.dart';
import '../../spinwheel/providers.dart';
import '../providers/exporter.dart';
import 'star_path.dart';

class WinOverlay extends ConsumerStatefulWidget {
  const WinOverlay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WinOverlayState();
}

class _WinOverlayState extends ConsumerState<WinOverlay> {
  late ConfettiController _startConfettiController;

  @override
  void initState() {
    _startConfettiController =
        ConfettiController(duration: const Duration(seconds: 10));

    _startConfettiController.play();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // is the puzzle complete
    final isPuzzleComplete = ref.watch(puzzleCompleteProvider);

    // selected color
    final selectedColor = ref.watch(selectedSpinColorProvider);

    // with Knowit logo
    // center with text to notify user puzzle complete contineu
    // then retry button at bottom
    // TODO: Add celebration by Changind the puzzle to a solved puzzle
    // show a popup to congragulate the player and then on click we display more content below for them or they can go to the next puzzle
// get the currently selected color to be the color of the center tile
    return Visibility(
      visible: isPuzzleComplete,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: knowItBlack.withOpacity(0.7),
        // color: knowItColor.withOpacity(0.5),
        child: Stack(
          children: [
            //
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Knowit logo
                Center(
                  child: Padding(
                    padding: padding16,
                    child: SvgPicture.asset(
                      knowItMiniSvg,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),

                // text
                Container(
                  padding: padding16,
                  margin: margin8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedColor,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      //
                      const Center(
                        child: Text(
                          "Puzzle Complete",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: knowItWhite,
                          ),
                        ),
                      ),

                      //
                      const ThickHorizontalDivider(dividerColor: knowItWhite),

                      //
                      const VerticalSpace(of: spacing16),

                      //
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Congratulations you have completed the puzzle. You can now continue to the next puzzle or retry this puzzle.",
                            style: TextStyle(
                              fontSize: 16,
                              color: knowItWhite,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      //
                      const VerticalSpace(of: spacing8),

                      // continue button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: knowItWhite,
                          foregroundColor: selectedColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: borderRadius45,
                          ),
                        ),
                        onPressed: () {
                          // complete the puzzle
                          ref
                              .read(puzzleCompleteProvider.notifier)
                              .update((state) => false);
                          //
                          context.pop();
                        },
                        icon: const Icon(
                            CupertinoIcons.arrow_up_right_circle_fill),
                        label: const Padding(
                          padding: EdgeInsets.only(top: 13.0, bottom: 12.0),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      //
                      const VerticalSpace(of: spacing8),

                      // continue button
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: knowItWhite,
                          backgroundColor: selectedColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: borderRadius45,
                          ),
                        ),
                        onPressed: () {
                          // complete the puzzle
                          ref
                              .read(puzzleCompleteProvider.notifier)
                              .update((state) => false);
                        },
                        icon: const Icon(CupertinoIcons.goforward),
                        label: const Padding(
                          padding: EdgeInsets.only(top: 13.0, bottom: 12.0),
                          child: Text(
                            "Retry",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // button
              ],
            ),

            //
            // confetti
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _startConfettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: true,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
                createParticlePath: starConfetti, // define a custom shape/path.
              ),
            ),

            //
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _startConfettiController.dispose();
    super.dispose();
  }
}
