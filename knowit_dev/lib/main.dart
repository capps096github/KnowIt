import 'package:flutter/material.dart';

import 'puzzle/puzzle.dart';

void main() {
  runApp(const KnowIt());
}


class KnowIt extends StatelessWidget {
  const KnowIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: "knowitId",
      home: PuzzleScreen(),
    );
  }
}
