import 'package:empeo/screens/main_nav.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import '../widgets/social_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String countryCode = "gb";
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color(0xFFE8541A),
          ),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8541A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.question_mark,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              ClipOval(
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: CountryFlag.fromCountryCode(countryCode),
                ),
              ),

              IconButton(
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                tooltip: 'Show languages',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Show language selector")),
                  );
                },
              ),

              const SizedBox(width: 8),
            ],
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Column(
            children: [
              Image.asset("assets/images/logo.jpg", height: 150, width: 150),
              const SizedBox(height: 15),
              // email
              TextField(
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.grey),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // password
              TextField(
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.grey),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Color(0xFFE8541A)),
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainNavigation())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE8541A),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or continue with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialWidget(imageUrl: "assets/images/google.png"),
                  const SizedBox(width: 15),
                  SocialWidget(imageUrl: "assets/images/facebook.png"),
                  const SizedBox(width: 15),
                  SocialWidget(imageUrl: "assets/images/office365.jpg"),
                  const SizedBox(width: 15),
                  SocialWidget(imageUrl: "assets/images/line.png"),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign in without email",
                    style: TextStyle(color: Color(0xFFE8541A)),
                  ),
                ],
              ),

              const Spacer(),

              Column(
                children: const [
                  Text(
                    "By continuing, you agree to our",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "Terms & Conditions AND Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
