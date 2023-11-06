import 'package:flutter/material.dart';

class BottomCustomNavigationBar extends StatelessWidget {
  BottomCustomNavigationBar({super.key, this.index,required this.onIndexSelected});
  final index;
  final Function(int) onIndexSelected;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: [
      NavigationDestination(icon: Icon(Icons.home), label: 'Trang chủ'),
      NavigationDestination(icon: Icon(Icons.notifications), label: 'Thông báo'),
      NavigationDestination(icon: Icon(Icons.timer), label: 'Lịch sử'),
      NavigationDestination(icon: Icon(Icons.person), label: 'Tài khoản')
    ],backgroundColor: Theme.of(context).colorScheme.secondary,
      onDestinationSelected: (value) {
        if (onIndexSelected != null) {
          onIndexSelected(value);
        }
      },selectedIndex: index,);
  }
}
