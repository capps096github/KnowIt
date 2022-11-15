import '../knowit_exporter.dart';

class KnowIt extends StatelessWidget {
  const KnowIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: knowitId,
      // home: CommunityAuth(),
    );
  }
}
