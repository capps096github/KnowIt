
import '../providers/exporter.dart';
import '../../../knowit_exporter.dart';

class PuzzleTimer extends StatelessWidget {
  const PuzzleTimer({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(timerNotifierProvider);

            return Text(
              state,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.timer,
          color: Colors.white,
          size: fontSize,
        )
      ],
    );
  }
}
