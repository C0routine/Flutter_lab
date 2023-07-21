import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootRouteBottomNavigationBar extends StatelessWidget {
  const RootRouteBottomNavigationBar({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: shell.currentIndex,
        onTap: (int index) {
          shell.goBranch(index, initialLocation: index == shell.currentIndex);
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.blue[50],
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 22),
        items: const [
          BottomNavigationBarItem(icon: FlutterLogo(), label: 'Flutter'),
          BottomNavigationBarItem(icon: Icon(Icons.developer_mode), label: 'Dart'),
        ],
      ),
    );
  }
}
