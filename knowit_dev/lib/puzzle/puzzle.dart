import 'package:knowit_dev/constants/margins.dart';

import '../knowit_exporter.dart';
import 'components/puzzle_components.dart';
import 'components/user_points.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: knowItTransparent,
        elevation: 0,
        title: const Text(
          "Puzzle #6",
          style: TextStyle(
            color: knowItColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {},
          color: knowItColor,
        ),
        actions: const [
          // icon showing crown and score
          CurrentUserPoints(),
        ],
      ),
      body: ListView(
        children: [
          // title of the game
          const Center(
            child: Text(
              "How to use Contraceptives",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: knowItColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // spacing
          const VerticalSpace(of: 20),
          // puzzle and buttons to be inside clip rect
          Container(
            margin: margin8,
            padding: padding8,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: borderRadius8,
              color: knowItColor,
            ),
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: const [
                // heading
                PuzzleHeader(),

                // puzzle
                SizedBox(
                  height: 300,
                  child: PuzzleTiles(),
                ),

                // timer that automatically increases per second
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "00:00",
                    style: TextStyle(
                      color: knowItWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                // buttons
                PuzzleControls(),
              ],
            ),
          ),
          // puzzle
          // buttons to start and shuffle too
          // tip tile a
          // video tile
        ],
      ),
    );
  }
}
