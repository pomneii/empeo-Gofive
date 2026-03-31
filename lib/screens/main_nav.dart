import 'package:empeo/screens/name_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar_widget.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';
import 'workinfo_screen.dart';
import 'task_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    CalendarScreen(),
    WorkInfoScreen(),
    NameScreen(),
    TaskScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: NavbarWidget(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}