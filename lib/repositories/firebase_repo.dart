import 'dart:math';
import 'package:ajnabee/models/salon_model.dart';
import 'package:ajnabee/models/salon_services_model.dart';
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

  // maybe move to utils later
  Future<int> addSalon() async {
    try {
      var mydata = [
        SalonModel(
            "Relax Salon",
            "nice",
            2,
            "dwarka,india",
            4,
            [
              SalonServicesModel(
                  serviceName: "Curly Hair", price: 99, type: "haircut")
            ],
            0)
      ];
      //data model entry
      //var salon = SalonModel(name:"Relax Salon",description: "nice", mobileNumber:2);

      print("adding salon");

      //data model entry finished
      int x = (await _firebaseFirestore.collection("SalonList").count().get())
          .count;

      print(x);

      for (int i = 0; i < mydata.length; i++) {
        //var mapdata = SalonModel.fromMap(mydata[i]);
        var mapdata = mydata[i];
        print(":)");

        await _firebaseFirestore
            .collection("SalonList")
            .doc(x.toString())
            .set(mapdata.toJson());
        x++;
      }

      return 1;
    } on FirebaseAuthException catch (e) {
      return 0;
    } catch (e) {
      print("~~~~~~adding salon error" + e.toString());
      return 0;
    }
  }

  //get SalonList model
  Future<List<SalonModel>> getSalons() async {
    try {
      var response = await _firebaseFirestore.collection("SalonList").get();
      var list =
          response.docs.map((doc) => SalonModel.fromMap(doc.data())).toList();
      print(list[0].name);
      return list;

      //return 1;
    } catch (e) {
      return [];
      //return 0;
    }
  }

    //get SalonList model
  Future<List<SalonServicesModel>> getSalonServices() async {
    try {
      var response = await _firebaseFirestore.collection("SalonServicesList").get();
      var list =
          response.docs.map((doc) => SalonServicesModel.fromMap(doc.data())).toList();
      print(list[0].serviceName);
      return list;

      //return 1;
    } catch (e) {
      return [];
      //return 0;
    }
  }
}

 

/////////////////////////////////////


