import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'components/auth_button.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Welcome Bloc",
              style: TextStyle(fontSize: 30),
            ),
            AuthButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctd) {
                  return BlocProvider(
                    create: (context) => AuthBloc(),
                    child: SignInScreen(),
                  );
                }));
              },
              name: "Sign In With Email",
            )
          ],
        ),
      ),
    );
  }
}
