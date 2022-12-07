import '../../knowit_exporter.dart';

class KnowItHome extends StatelessWidget {
  const KnowItHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KnowIt Home'),
      ),
      body: const Center(
        child: Text('KnowIt Home'),
      ),
    );
  }
}
