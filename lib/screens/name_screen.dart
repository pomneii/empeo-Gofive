import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> team = [
    {
      "name":
          "Praewa Nantapgjaskdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffinj",
      "role": "Part-time Officer",
    },
    {"name": "Sarayut Pasakul", "role": "Part-time Officer"},
    {"name": "Rat Sangkrajang", "role": "IT"},
    {"name": "pornpawit suttha", "role": "Department Manager"},
    {"name": "Test Onboard", "role": "Part-time Officer"},
    {
      "name":
          "Praewa Nantapgjaskdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffinj",
      "role": "Part-time Officer",
    },
    {"name": "Sarayut Pasakul", "role": "Part-time Officer"},
    {"name": "Rat Sangkrajang", "role": "IT"},
    {"name": "pornpawit suttha", "role": "Department Manager"},
    {"name": "Test Onboard", "role": "Part-time Officer"},
    {"name": "Rat Sangkrajang", "role": "IT"},
    {"name": "pornpawit suttha", "role": "Department Manager"},
    {"name": "Test Onboard", "role": "Part-time Officer"},
  ];

  List<String> recent = [
    "Ratfagoaha;lhamag",
    "Onboard",
    "Qq",
    "Qq",
    "Sarayut",
    "kiki",
    "kuku",
    "kiki",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() => selectedIndex = 0);
              },
              icon: FaIcon(
                selectedIndex == 0
                    ? FontAwesomeIcons.solidHouse
                    : FontAwesomeIcons.house,
                color: selectedIndex == 0
                    ? const Color(0xFFE8541A)
                    : Colors.grey,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() => selectedIndex = 1);
              },
              icon: FaIcon(
                selectedIndex == 1
                    ? FontAwesomeIcons.solidCalendarDays
                    : FontAwesomeIcons.calendarDays,
                color: selectedIndex == 1
                    ? const Color(0xFFE8541A)
                    : Colors.grey,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() => selectedIndex = 2);
              },
              icon: FaIcon(
                selectedIndex == 2
                    ? FontAwesomeIcons.users
                    : FontAwesomeIcons.users,
                color: selectedIndex == 2
                    ? const Color(0xFFE8541A)
                    : Colors.grey,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() => selectedIndex = 3);
              },
              icon: FaIcon(
                selectedIndex == 3
                    ? FontAwesomeIcons.solidAddressBook
                    : FontAwesomeIcons.addressBook,
                color: selectedIndex == 3
                    ? const Color(0xFFE8541A)
                    : Colors.grey,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() => selectedIndex = 4);
              },
              icon: FaIcon(
                selectedIndex == 4
                    ? FontAwesomeIcons.book
                    : FontAwesomeIcons.listCheck,
                color: selectedIndex == 4
                    ? const Color(0xFFE8541A)
                    : Colors.grey,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() => selectedIndex = 5);
              },
              icon: FaIcon(
                selectedIndex == 5
                    ? FontAwesomeIcons.solidUser
                    : FontAwesomeIcons.user,
                color: selectedIndex == 5
                    ? const Color(0xFFE8541A)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // search bar
              SearchBar(
                controller: searchController,
                backgroundColor: const WidgetStatePropertyAll(
                  Color(0xFFF6F6F8),
                ),
                leading: const Icon(Icons.search, size: 20, color: Colors.grey),
                hintText: "Search staff name, role, or email",
                hintStyle: const WidgetStatePropertyAll(
                  TextStyle(fontSize: 14, color: Colors.grey),
                ),
                elevation: const WidgetStatePropertyAll(0),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 12),
                ),
                constraints: const BoxConstraints(minHeight: 42),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),

              const SizedBox(height: 24),

              // recent searches
              const Text(
                "Recent Searches",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 14),

              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recent.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade300,
                            child: Text(
                              recent[index][0],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),

                          SizedBox(
                            width: 54,
                            child: Text(
                              recent[index],
                              style: const TextStyle(fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 18),

              // own team
              const Text(
                "Own Team",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: team.length,
                  itemBuilder: (context, index) {
                    final member = team[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade300,
                            child: Text(
                              member["name"]![0],
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member["name"]!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  member["role"]!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
