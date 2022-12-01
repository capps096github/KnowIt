import 'package:flutter/cupertino.dart';

import '../../knowit_exporter.dart';

class PuzzleControls extends StatelessWidget {
  const PuzzleControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        runSpacing: spacing8,
        spacing: spacing8,
        children: [
          Expanded(
            child: AppButton.small(
              text: "START",
              iconData: CupertinoIcons.wand_stars,
              onTap: () {
                // ignore: avoid_print
                print("START");
              },
            ),
          ),
          Expanded(
            child: AppButton.small(
              text: "SHUFFLE",
              iconData: CupertinoIcons.arrow_3_trianglepath,
              onTap: () {
                // ignore: avoid_print
                print("SHUFFLE");
              },
            ),
          ),
        ],
      ),
    );
  }
}
