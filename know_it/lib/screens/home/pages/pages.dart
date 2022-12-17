import 'package:flutter/cupertino.dart';

import '../../../knowit_exporter.dart';
import 'game.dart';

class HomePage {
  // icon data
  final IconData unselectedIcon, selectedIcon;

  // title
  final String title;
  // screen
  final Widget screen;

  final String? tooltip;

  HomePage({
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.title,
    required this.screen,
    this.tooltip,
  });
}

// nav screens home, Jobs, forum, messages
final List<HomePage> homePages = [
  HomePage(
    unselectedIcon: Icons.location_on_outlined,
    selectedIcon: Icons.location_on,
    title: "Jobs",
    tooltip: "Go to Jobs",
    screen: const KnowItPlaceholder(title: "Jobs"),
  ),
  HomePage(
    unselectedIcon: Icons.forum_outlined,
    selectedIcon: CupertinoIcons.game_controller_solid,
    title: "Game",
    tooltip: "Go to Game",
    screen: const GameScreen(),
  ),
  HomePage(
    unselectedIcon: Icons.mail_outlined,
    selectedIcon: Icons.mail,
    title: "Profile",
    tooltip: "Go to Profile",
    screen: const KnowItProfile(),
  ),
];
