import 'package:empeo/screens/name_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar_widget.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';
import 'workinfo_screen.dart';
import 'task_screen.dart';
import 'profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calendar/calendar_bloc.dart';
import '../bloc/name/name_bloc.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),

    BlocProvider(create: (_) => CalendarBloc(), child: const CalendarScreen()),

    const WorkInfoScreen(),

    // ✅ เพิ่มตรงนี้
    BlocProvider(create: (_) => NameBloc(), child: const NameScreen()),

    const TaskScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),

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
