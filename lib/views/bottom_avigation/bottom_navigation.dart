import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key, required this.body});
  final StatefulNavigationShell body;

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final _selectedIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.body,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex.value,
          onDestinationSelected: (index) {
            widget.body.goBranch(
              index,
              initialLocation: index == widget.body.currentIndex,
            );
            setState(() {
              _selectedIndex.value = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ));
  }
}
