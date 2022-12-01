import '../../../knowit_exporter.dart';

class PuzzleTiles extends StatelessWidget {
  const PuzzleTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: GridView.builder(
        itemCount: 16,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: spacing8,
          mainAxisSpacing: spacing8,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: knowItWhite,
              borderRadius: borderRadius4,
            ),
            child: Center(
              child: Text(
                "${(index + 1)}",
                style: const TextStyle(
                  fontSize: 40,
                  color: knowItColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
