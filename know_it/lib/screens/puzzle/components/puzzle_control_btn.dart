import '../../../knowit_exporter.dart';
import '../logic/exporter.dart';
import '../providers/providers.dart';

class PuzzleControlButton extends StatelessWidget {
  const PuzzleControlButton({
    Key? key,
    required PuzzleSolverClient solverClient,
    required PuzzleData initialPuzzleData,
    this.width = 145,
    this.padding = const EdgeInsets.only(top: 13.0, bottom: 12.0),
  })  : _solverClient = solverClient,
        _initialPuzzleData = initialPuzzleData,
        super(key: key);

  final PuzzleSolverClient _solverClient;
  final PuzzleData _initialPuzzleData;
  final double width;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(puzzleNotifierProvider(_solverClient));

        return state.when(
          () => PuzzleControlButtonBody(
            text: 'Start Game',
            onTap: () => ref
                .read(puzzleNotifierProvider(_solverClient).notifier)
                .initializePuzzle(
                  initialPuzzleData: _initialPuzzleData,
                ),
            padding: padding,
            width: width,
          ),
          initializing: () => PuzzleControlButtonBody(
            text: 'Get ready...',
            onTap: null,
            padding: padding,
            width: width,
          ),
          scrambling: (_) => PuzzleControlButtonBody(
            text: 'Get ready...',
            onTap: null,
            padding: padding,
            width: width,
          ),
          current: (puzzleData) => PuzzleControlButtonBody(
            text: 'Restart',
            onTap: () {
              ref.read(timerNotifierProvider.notifier).stopTimer();
              ref
                  .read(puzzleNotifierProvider(_solverClient).notifier)
                  .restartPuzzle();
            },
            padding: padding,
            width: width,
          ),
          computingSolution: (puzzleData) => PuzzleControlButtonBody(
            text: 'Processing...',
            onTap: null,
            padding: padding,
            width: width,
          ),
          autoSolving: (puzzleData) => PuzzleControlButtonBody(
            text: 'Solving...',
            onTap: null,
            padding: padding,
            width: width,
          ),
          solved: (puzzleData) => PuzzleControlButtonBody(
            text: 'Start Game',
            onTap: () => ref
                .read(puzzleNotifierProvider(_solverClient).notifier)
                .initializePuzzle(
                  initialPuzzleData: puzzleData,
                ),
            padding: padding,
            width: width,
          ),
          error: (_) => PuzzleControlButtonBody(
            text: 'Start Game',
            onTap: () => ref
                .read(puzzleNotifierProvider(_solverClient).notifier)
                .initializePuzzle(
                  initialPuzzleData: _initialPuzzleData,
                ),
            padding: padding,
            width: width,
          ),
        );
      },
    );
  }
}

class PuzzleControlButtonBody extends ConsumerWidget {
  const PuzzleControlButtonBody({
    Key? key,
    required this.text,
    required this.onTap,
    required this.width,
    required this.padding,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final double width;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
              }

              return Theme.of(context)
                  .colorScheme
                  .primary; // Use the component's default.
            },
          ),
        ),
        // style: ElevatedButton.styleFrom(
        //   onPrimary: Palette.blue,
        //   onSurface: Palette.blue,
        //   primary: Palette.blue,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        // ),
        onPressed: onTap,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(onTap == null ? 0.6 : 1),
            ),
          ),
        ),
      ),
    );
  }
}
