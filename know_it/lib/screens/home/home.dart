import '../../knowit_exporter.dart';
import 'fab.dart';
import 'home_providers.dart';
import 'navbar/nav_appbar.dart';
import 'pages/pages.dart';

class KnowItHome extends ConsumerWidget {
  const KnowItHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          knowItFull,
          height: 40,
        ),
      ),
      body: const HomeScreens(),
      floatingActionButton: const HomeGameFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const HomeNavAppBar(),
    );
  }
}

class HomeScreens extends ConsumerWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndex = ref.watch(selectedNavBarIndexProvider);

    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: knowItTransparent,
          child: child,
        );
      },
      duration: halfSeconds,
      child: homePages[navBarIndex].screen,
    );
  }
}
