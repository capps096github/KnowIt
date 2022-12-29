import 'knowit_exporter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //
  runApp(
    const ProviderScope(
      child: KnowIt(),
    ),
  );
}


// launcher icon (done)
// app name
// play store
// splash screen