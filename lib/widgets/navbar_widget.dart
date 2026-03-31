import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const NavbarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  Color getColor(int index) {
    return selectedIndex == index ? const Color(0xFFE8541A) : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            0,
            const FaIcon(FontAwesomeIcons.house, color: Colors.grey),
            const FaIcon(FontAwesomeIcons.solidHouse, color: Color(0xFFE8541A)),
          ),

          _navItem(
            1,
            const FaIcon(FontAwesomeIcons.calendarDays, color: Colors.grey),
            const FaIcon(
              FontAwesomeIcons.solidCalendarDays,
              color: Color(0xFFE8541A),
            ),
          ),

          _navItem(
            2,
            const FaIcon(FontAwesomeIcons.users, color: Colors.grey),
            const FaIcon(FontAwesomeIcons.users, color: Color(0xFFE8541A)),
          ),
          _navItem(
            3,
            const FaIcon(FontAwesomeIcons.addressBook, color: Colors.grey),
            const FaIcon(
              FontAwesomeIcons.solidAddressBook,
              color: Color(0xFFE8541A),
            ),
          ),
          _navItem(
            4,
            const FaIcon(FontAwesomeIcons.listCheck, color: Colors.grey),
            const FaIcon(FontAwesomeIcons.book, color: Color(0xFFE8541A)),
          ),
          _navItem(
            5,
            const FaIcon(FontAwesomeIcons.user, color: Colors.grey),
            const FaIcon(FontAwesomeIcons.solidUser, color: Color(0xFFE8541A)),
          ),
        ],
      ),
    );
  }

  Widget _navItem(int index, Widget icon, Widget activeIcon) {
    return IconButton(
      onPressed: () => onTap(index),
      icon: selectedIndex == index ? activeIcon : icon,
    );
  }
}
