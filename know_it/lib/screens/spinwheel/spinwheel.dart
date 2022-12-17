import '../../knowit_exporter.dart';
import 'test_chat.dart';
import 'test_chat_2.dart';

class KnowItSpinWheel extends ConsumerWidget {
  const KnowItSpinWheel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return Scaffold(
    //   body: Column(
    //     children: const [
    //       // Expanded(
    //       //   child: Container(
    //       //     color: knowItColor,
    //       //   ),
    //       // ),

    //       // text
    //       Text("data"),
    //     ],
    //   ),
    // );
    return const ChatScreeny();
  }
}
