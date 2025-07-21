import 'package:flutter/material.dart';

class MenuBarraAbajo extends StatelessWidget {
  final int currentIndex;

  const MenuBarraAbajo({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index != currentIndex) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/estadistica');
              break;
              case 2:
              Navigator.pushNamed(context, '/balance');
              break;
            case 3:
              Navigator.pushNamed(context, '/inventario');
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.inventory), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
