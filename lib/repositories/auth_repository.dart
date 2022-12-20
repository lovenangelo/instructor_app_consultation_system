import 'dart:developer';

import 'package:consultation_system/repositories/auth_repository_interface.dart';
import 'package:consultation_system/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements AuthRepositoryInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<List<void>?> loginOfuser(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  @override
  userSignUp(
      String firstName,
      String middleName,
      String surName,
      String contactNumber,
      String email,
      String password,
      String uid,
      String course) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = FirebaseAuth.instance.currentUser!;
      await UserRepository().addUser(firstName, middleName, surName,
          contactNumber, email, password, user.uid, course);
    } catch (e) {
      log(e.toString());
    }
  }
}
