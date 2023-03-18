import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<Map<String, dynamic>> sendOTP(String phoneNo) async {
    Map<String, dynamic> result = {
      "errorMessage": null,
      "verificationId": null,
    };
    print("1 > phoneNo: $phoneNo");
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("2 > credential: $credential");
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("3 > e: $e");
        result["errorMessage"] = e.message.toString();
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("4 > verificationId: $verificationId");
        result["verificationId"] = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("5 > verificationId: $verificationId");
        result["verificationId"] = verificationId;
      },
    );
    return result;
  }

  static Future<User?> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    return user;
  }
}
