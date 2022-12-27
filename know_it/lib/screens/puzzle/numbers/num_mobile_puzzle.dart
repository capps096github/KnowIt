import '../../../knowit_exporter.dart';
import '../components/exporter.dart';
import '../logic/exporter.dart';
import '../providers/exporter.dart';

class NumPuzzleMobile extends ConsumerStatefulWidget {
  const NumPuzzleMobile({
    required this.solverClient,
    required this.initialPuzzleData,
    required this.puzzleSize,
    required this.puzzleType,
    Key? key,
  }) : super(key: key);

  final PuzzleSolverClient solverClient;
  final PuzzleData initialPuzzleData;
  final int puzzleSize;
  final String puzzleType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SoloScreenLargeState();
}

class _SoloScreenLargeState extends ConsumerState<NumPuzzleMobile> {
  late final PuzzleSolverClient _solverClient;
  late final int _puzzleSize;
  late final PuzzleData _initialPuzzleData;
  late final String _puzzleType;
  bool _isStartPressed = false;

  @override
  void initState() {
    _solverClient = widget.solverClient;
    _puzzleSize = widget.puzzleSize;
    _initialPuzzleData = widget.initialPuzzleData;
    _puzzleType = widget.puzzleType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(puzzleNotifierProvider(_solverClient),
        (previous, PuzzleState next) {
      if (next is PuzzleSolved) {
        // TODO: Add celebration by Changind the puzzle to a solved puzzle
        // show a popup to congragulate the player and then on click we display more content below for them or they can go to the next puzzle
      }
      if (next is PuzzleInitializing) {
        setState(() {
          _isStartPressed = true;
        });
      }
    });

    var fontSize = 48.0;
    var boardSize = 300.0;

    var spacing = 3;
    var eachBoxSize = (boardSize / _puzzleSize) - (spacing * (_puzzleSize - 1));

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              const VerticalSpace(of: 30),
              const Text(
                'Puzzle Challenge',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: knowItWhite,
                ),
              ),
              const VerticalSpace(of: 8),
              // number of moves
              NumberOfMoves(
                solverClient: _solverClient,
                fontSize: 22,
              ),
              const VerticalSpace(of: 8),
              const PuzzleTimer(fontSize: 24),
              // tab bar for switching between puzzle types
              // PreferredSize(
              //   child: TopBar(
              //     puzzleSize: _puzzleSize,
              //     puzzleType: _puzzleType,
              //     color: Theme.of(context).colorScheme.background,
              //     tileGap: 4,
              //     padding: const EdgeInsets.only(top: 10, bottom: 8),
              //     isCentered: true,
              //   ),
              //   preferredSize: const Size(double.maxFinite, 100),
              // ),
              const VerticalSpace(of: 36),
              PuzzleWidget(
                solverClient: _solverClient,
                boardSize: boardSize,
                eachBoxSize: eachBoxSize,
                initialPuzzleData: _initialPuzzleData,
                fontSize: fontSize,
                kInitialSpeed: kInitialSpeed,
                borderRadius: 16,
              ),
              const VerticalSpace(of: 24),
              PuzzleControlButton(
                solverClient: _solverClient,
                initialPuzzleData: _initialPuzzleData,
              ),
              const VerticalSpace(of: 100),
            ],
          ),
        ),
        CountDownOverlay(
          isStartPressed: _isStartPressed,
          onFinish: () {
            ref.read(timerNotifierProvider.notifier).startTimer();
            setState(() {
              _isStartPressed = false;
            });
          },
          initialSpeed: kInitialSpeed,
        ),
      ],
    );
  }
}
