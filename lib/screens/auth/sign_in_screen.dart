import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'components/auth_button.dart';
import 'components/auth_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 10),
            AuthField(
              controller: emailController,
              hintText: "Enter Valid Email",
              onChanged: (value) {
                BlocProvider.of<AuthBloc>(context).add(SignInFieldsEvent(
                    emailValu: emailController.text.trim(),
                    passwordValue: passwordController.text.trim()));
              },
            ),
            const SizedBox(height: 10),
            AuthField(
              controller: passwordController,
              hintText: "Enter Password",
              onChanged: (value) {
                BlocProvider.of<AuthBloc>(context).add(SignInFieldsEvent(
                    emailValu: emailController.text.trim(),
                    passwordValue: passwordController.text.trim()));
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state is SignInLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : AuthButton(
                        onPressed: () {
                          if (state is SignInValidState) {
                            BlocProvider.of<AuthBloc>(context).add(
                                SignInSubmitEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim()));
                          }
                        },
                        name: "Submit",
                        backgroundColor: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
