import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ajnabee/models/user_model.dart';

class FirebaseRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
  late User user;
  late UserModel userModel;

  Future<int> alreadyLoggedIn() async {
    User? user = await _firebaseAuth.currentUser;

    if (user == null) {
      return 1;
    } else {
      var response =
          await _firebaseFirestore.collection("Users").doc(user.uid).get();
      print(response.data());

      return 0;
    }
  }

  Future<int> login({required String email, required String password}) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("loggedin1");

      user = userCredential.user!;

      var response =
          await _firebaseFirestore.collection("Users").doc(user.uid).get();

      // print(response.data()!);
      // print(response.data());

      userModel = UserModel.fromMap(response.data()!);

      return 1;
    } catch (e) {
      print("login error" + e.toString());
      return 0;
    }
  }

  Future<int> signUp(
      {required String email,
      required String password,
      required String name,
      required int mobileNumber}) async {
    //regsitration
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user!;
      //data model entry
      userModel = UserModel(
        uid: user.uid ?? "",
        email: user.email ?? "email",
        name: name,
        mobileNumber: mobileNumber,
      );

      //data model entry finished
      await _firebaseFirestore
          .collection("Users")
          .doc(user.uid)
          .set(userModel.toJson());

      return 1;
    } on FirebaseAuthException catch (e) {
      print("login error" + e.toString());
      return 0;
      // if (e.code == 'weal-password') {
      //   throw Exception('This password is weak');
      // } else if (e.code == 'email-already-in-use') {
      //   throw Exception('Account already exists');
      // }
    } catch (e) {
      print("login error" + e.toString());
      return 0;
      //throw Exception(e.toString());
    }
  }

  Future<void> updateUserModel() async {
    print("user updated!");
    await _firebaseFirestore
        .collection("Users")
        .doc(user.uid)
        .update(userModel.toJson());
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}

 

/////////////////////////////////////


