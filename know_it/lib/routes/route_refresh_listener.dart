import 'dart:async';

import '../knowit_exporter.dart';


class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream({required Stream<dynamic> stream}) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}