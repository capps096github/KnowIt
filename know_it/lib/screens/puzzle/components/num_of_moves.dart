import '../logic/exporter.dart';
import '../providers/providers.dart';
import '../../../knowit_exporter.dart';

class NumberOfMoves extends StatelessWidget {
  const NumberOfMoves({
    Key? key,
    required PuzzleSolverClient solverClient,
    this.fontSize = 24,
  })  : _solverClient = solverClient,
        super(key: key);

  final PuzzleSolverClient _solverClient;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(puzzleNotifierProvider(_solverClient));

        return state.when(
          () => MovesText(
            moves: 0,
            tiles: 0,
            fontSize: fontSize,
          ),
          initializing: () => MovesText(
            moves: 0,
            tiles: 0,
            fontSize: fontSize,
          ),
          scrambling: (_) => MovesText(
            moves: 0,
            tiles: 0,
            fontSize: fontSize,
          ),
          current: (puzzleData) => MovesText(
            moves: puzzleData.moves,
            tiles: puzzleData.tiles,
            fontSize: fontSize,
          ),
          computingSolution: (puzzleData) => MovesText(
            moves: puzzleData.moves,
            tiles: puzzleData.tiles,
            fontSize: fontSize,
          ),
          autoSolving: (puzzleData) => MovesText(
            moves: puzzleData.moves,
            tiles: puzzleData.tiles,
            fontSize: fontSize,
          ),
          solved: (puzzleData) => MovesText(
            moves: puzzleData.moves,
            tiles: puzzleData.tiles,
            fontSize: fontSize,
          ),
          error: (_) => MovesText(
            moves: 0,
            tiles: 0,
            fontSize: fontSize,
          ),
        );
      },
    );
  }
}

class MovesText extends StatelessWidget {
  final int moves;
  final int tiles;
  final double fontSize;

  const MovesText({
    Key? key,
    required this.moves,
    required this.tiles,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          // fontWeight: FontWeight.w500,
          color: knowItWhite,
        ),
        children: [
          TextSpan(
            text: moves.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: ' Moves | '),
          TextSpan(
            text: tiles.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: ' Tiles'),
        ],
      ),
    );
  }
}
