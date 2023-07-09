import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar(this.child, {super.key});
  final StatefulNavigationShell child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: child.currentIndex,
        onDestinationSelected: (value) {
          child.goBranch(value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper),
            label: 'Discover',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    if (location.startsWith('/feed')) {
      return 0;
    }
    if (location.startsWith('/discover')) {
      return 1;
    }
    return 0;
  }
}
