import 'package:authenticatio_with_bloc/screens/auth/components/auth_button.dart';
import 'package:authenticatio_with_bloc/screens/auth/components/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';

class SignInWithPhoneScreen extends StatelessWidget {
  SignInWithPhoneScreen({super.key});
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign In With Phone"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthField(
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                maxLength: 10,
                labelText: "Enter Phone Number",
                hintText: "333-1234567",
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthCodeSentState) {
                    Navigator.pushNamed(context, "/verify_otp_screen",
                        arguments: state.verificationId);
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  return AuthButton(
                      onPressed: () {
                        String phoneNo = "+92${_phoneController.text}";
                        BlocProvider.of<AuthCubit>(context).sendOTP(phoneNo);
                      },
                      name: "Log in");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
