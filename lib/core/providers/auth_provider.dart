// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/core/global/global.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/firestore.dart';
import 'package:kunke_naturals_admin_app/core/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kunke_naturals_admin_app/data/models/user_model.dart';
import 'package:kunke_naturals_admin_app/presentation/auth/login.dart';
import 'package:kunke_naturals_admin_app/presentation/navigation/bottom_navigation.dart';

class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  //SETTER
  bool _isLoading = false;

//GETTER
  bool get isLoading => _isLoading;

//CREATE NEW USER ACCOUNT METHOD
  Future registerWithEmailAndPassword(BuildContext context, String email,
      String password, String firstName, String lastName, String phone) async {
    try {
      _isLoading = true;
      notifyListeners();
      //TRY TO CREATE ACCOUNT USING EMAIL & PASSWORD PROVIDED
      final authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = authResult.user;
      if (firebaseUser != null) {
        final thisInstant = getTimestamp();
        final user = UserModel(
          id: firebaseUser.uid,
          firstName: firstName,
          lastName: lastName,
          fullName: '$firstName $lastName',
          emailAddress: email,
          phoneNumber: phone,
          createdAt: thisInstant,
        );

        await _firestore.userRef(user.id).set(user);
      } else {
        return;
      }
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e.code == 'operation-not-allowed') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 5),
            content: Text(
                'Your account has been disabled. Please contact support.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 5),
            content: Text('Email already in use by another account.')));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

//USER SIGN IN METHOD
  Future signInWithEmailAndPassword(
      BuildContext context, String email, password) async {
    try {
      _isLoading = true;
      notifyListeners();
      final authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = authResult.user;
      if (firebaseUser != null) {
        final userId = firebaseUser.uid;
        final thisInstant = getTimestamp();

        await _firestore.collection(DbCollectionIds.admin).doc(userId).update({
          "last_seen": thisInstant,
        }).whenComplete(() {
          _isLoading = false;
          notifyListeners();
          context.pushOff(const BottomNavigationScreen());
        });
      }
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 5),
            content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 5),
            content: Text('Incorrect password')));
      } else if (e.code == 'user-disabled') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            duration: Duration(seconds: 5),
            content: Text(
                'Your account has been disabled. Please contact support.')));
      }
    }
  }

  //RESET PASSWORD
  resetPassword(BuildContext context, String email) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _auth.sendPasswordResetEmail(email: email).whenComplete(() {
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
            content:
                Text("Link to reset your password has been sent to $email"),
            actions: []));
      });
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(content: Text(e.message!), actions: []));
    }
  }

//USER SIGN OUT METHOD
  signOut(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      await prefs!.clear();

      await _auth.signOut().then((value) {
        _isLoading = false;
        notifyListeners();
        context.pushOff(const LoginPage());
      });
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5),
          content: Text('Something went wrong. Try again')));
    }
    notifyListeners();
  }
}
