import 'package:authenticatio_with_bloc/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/auth_button.dart';
import 'components/auth_field.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String verificationId;
  VerifyOtpScreen({super.key, required this.verificationId});
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Otp Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthField(
                prefixIcon: Icons.verified_user,
                keyboardType: TextInputType.number,
                controller: _otpController,
                maxLength: 6,
                labelText: "Enter OTP",
                hintText: "6-Digit",
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthCodeVerifiedState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, "/home_screen");
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return AuthButton(
                      onPressed: () {
                        String otp = _otpController.text;
                        BlocProvider.of<AuthCubit>(context)
                            .verifyOTP(verificationId, otp);
                      },
                      name: "Verify");
                },
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
