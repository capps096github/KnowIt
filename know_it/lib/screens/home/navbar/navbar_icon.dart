import '../../../knowit_exporter.dart';

class NavAppBarIcon extends StatelessWidget {
  const NavAppBarIcon({
    Key? key,
    required this.isSelected,
    required this.unselectedIcon,
    required this.selectedIcon,
    this.onPressed,
  }) : super(key: key);

  final bool isSelected;

  // icon data
  final IconData unselectedIcon, selectedIcon;

  // on pressed
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedSwitcher(
        duration: halfSeconds,
        child: Icon(
          isSelected ? selectedIcon : unselectedIcon,
          key: ValueKey(isSelected),
          color: knowItWhite,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
