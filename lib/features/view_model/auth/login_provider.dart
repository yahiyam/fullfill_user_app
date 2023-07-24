// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/dialog_utils.dart';
import '../../../utils/instence.dart';


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
      readDataAndSetDataLocally(currentUser!, context);
    }
    notifyListeners();
  }

  Future readDataAndSetDataLocally(
    User currentUser,
    BuildContext context,
  ) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        await sharedPreferences!.setString("uid", currentUser.uid);
        await sharedPreferences!.setString("email", snapshot.data()!["userEmail"]);
        await sharedPreferences!.setString("name", snapshot.data()!["userName"]);
        await sharedPreferences!.setString("photoUrl", snapshot.data()!["userAvatarUrl"]);

        List<String> userCartList = snapshot.data()!["userCart"].cast<String>();
        await sharedPreferences!.setStringList("userCart", userCartList);

        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        firebaseAuth.signOut();
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
        showMessageDialog(
          context,
          message: "no record exists.",
        );
      }
    });
    notifyListeners();
  }
}
