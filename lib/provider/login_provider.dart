import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_user_app/presentation/commonFunctions/show_message_dialog.dart';

import '../Globals/instence.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> loginFormValidation(BuildContext context) async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      //login
      loginNow(context);
    } else {
      showMessageDialog(
        context,
        message: "Please write email/password.",
      );
    }
    notifyListeners();
  }

  Future<void> loginNow(BuildContext context) async {
    showMessageDialog(
      context,
      isLoading: true,
      message: "Checking Credentials",
    );
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showMessageDialog(
        context,
        message: error.message.toString(),
      );
    });
    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!).then((value) {
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    }
    notifyListeners();
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      await sharedPreferences!.setString("uid", currentUser.uid);
      await sharedPreferences!
          .setString("email", snapshot.data()!["userEmail"]);
      await sharedPreferences!.setString("name", snapshot.data()!["userName"]);
      await sharedPreferences!
          .setString("photoUrl", snapshot.data()!["userAvatarUrl"]);
    });
    notifyListeners();
  }
}
