import 'package:flutter/material.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  List<int> pin = [];

  void addNumber(int number) {
    if (pin.length < 6) {
      setState(() {
        pin.add(number);
      });
    }
  }

  void deleteNumber() {
    if (pin.isNotEmpty) {
      setState(() {
        pin.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Create your PIN",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const Text(
                "To allow secure acces to app and payslip information",
                style: TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 40),

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE8541A), width: 3),
                ),
                child: const Icon(
                  Icons.lock,
                  color: Color(0xFFE8541A),
                  size: 40,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Enter the 6 digit pin code.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) => pinDot(index))
              ),

              const Spacer(),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton("1"),
                      numberButton("2"),
                      numberButton("3"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton("4"),
                      numberButton("5"),
                      numberButton("6"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton("7"),
                      numberButton("8"),
                      numberButton("9"),
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 70),
                    numberButton("0"),
                    GestureDetector(
                      onTap: deleteNumber,
                      child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 70,
                        child: const Icon(Icons.backspace_outlined),
                      ),
                    ),
                  ],
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numberButton(String number) {
    return GestureDetector(
      onTap: () {
        addNumber(int.parse(number));
      },
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 70,
        child: Text(
          number,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget pinDot(int index) {
    bool filled = index < pin.length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? const Color(0xFFE8541A) : Colors.transparent,
        border: Border.all(
          color: filled ? const Color(0xFFE8541A) : Colors.grey.shade400,
        ),
      ),
    );
  }
}
