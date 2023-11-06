import 'package:economic/presentation/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _HomePageState();
}

class _HomePageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DashBoard();
  }
}
