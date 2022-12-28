import '../../knowit_exporter.dart';
import 'components/game_selected_tile.dart';
import 'components/game_tip.dart';
import 'components/game_wheel.dart';

class KnowItSpinWheel extends ConsumerWidget {
  const KnowItSpinWheel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: padding16,
        child: Column(
          children: const [
            // tip
            GameTip(),

            // text
            Expanded(child: Center(child: GameWheel())),

            // game selected
            GameSelectedTile(),

            VerticalSpace(of: spacing16),
          ],
        ),
      ),
    );
  }
}
