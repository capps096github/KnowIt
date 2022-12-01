import 'package:flutter/cupertino.dart';

import '../../knowit_exporter.dart';

class PuzzleHeader extends StatelessWidget {
  const PuzzleHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding4,
      child: Column(
        children: const [
          Icon(
            CupertinoIcons.hand_draw,
            color: knowItWhite,
            size: 50,
          ),
          VerticalSpace(of: spacing4),
          Center(
            child: Text(
              "Puzzle",
              style: TextStyle(
                fontSize: 25,
                color: knowItWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
