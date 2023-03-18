import 'package:flutter/material.dart';
import 'components/auth_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  "Welcome Bloc",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            AuthButton(
              onPressed: () {
                Navigator.pushNamed(context, "/sign_in_screen");
              },
              name: "Sign In With Email",
            ),
            const SizedBox(height: 20),
            AuthButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/sign_in_with_phone_screen");
                },
                name: "Sign in with Phone")
          ],
        ),
      ),
    );
  }
}
