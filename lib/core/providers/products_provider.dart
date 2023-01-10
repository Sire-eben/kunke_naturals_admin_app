import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/config/strings.dart';
// import 'package:kunke_naturals_admin_app/core/global/global.dart';
import 'package:kunke_naturals_admin_app/core/utils/exceptions.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/context.dart';
import 'package:kunke_naturals_admin_app/core/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kunke_naturals_admin_app/presentation/auth/success.dart';

class ProductsProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  // final List<XFile> _selectedFiles = [];
  FirebaseStorage storageRef = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final List<String> _arrImageUrls = [];
  int uploadItem = 0;

  Future<void> uploadFunction(
    List<XFile> images,
    BuildContext context,
    String productName,
    String productDescription,
    String price,
    String qty,
    bool addCoupon,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();
      for (int i = 0; i < images.length; i++) {
        var imageUrl = await uploadFiles(images[i]);
        _arrImageUrls.add(imageUrl.toString());
      }
      final user = _auth.currentUser;
      final thisInstant = getTimestamp();
      if (user != null) {
        String productId = getRandomReferenceId();
        await _firestore
            .collection(DbCollectionIds.products)
            .doc(productId)
            .set({
          "product_id": productId,
          "product_name": productName,
          "product_description": productDescription,
          "imageUrls": _arrImageUrls,
          "product_price": int.parse(price),
          "product_qty": int.parse(qty),
          "created_at": thisInstant,
        }).whenComplete(() {
          _isLoading = false;
          notifyListeners();
          context.replace(
            const ConfirmationSuccess(
              heading: "Successful!",
              subtitle: "product added successfully!",
            ),
          );
        });
      }
    } on FirebaseServerException {
      _isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: somethingWrong);
    }
  }

  Future<String> uploadFiles(XFile images) async {
    try {
      final randomId = getRandomReferenceId();
      Reference reference = storageRef
          .ref()
          .child(DbCollectionIds.products)
          .child(randomId)
          .child(images.name);
      UploadTask uploadTask = reference.putFile(File(images.path));
      await uploadTask.whenComplete(() {
        uploadItem++;
        if (uploadItem == images.length) {
          uploadItem = 0;
        }
      });
      return await reference.getDownloadURL();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      throw somethingWrong;
      // Fluttertoast.showToast(msg: somethingWrong);
    }
  }

  void editproduct(
    String productId,
    String price,
    String productName,
    String productDescription,
    String productqty,
  ) {
    try {
      _isLoading = true;
      notifyListeners();
      final user = _auth.currentUser;
      if (user != null) {
        final thisInstant = getTimestamp();
        _firestore.collection(DbCollectionIds.products).doc(productId).update({
          "price": price,
          "product_name": productName,
          "product_description": productDescription,
          "product_qty": productqty,
          "updated_at": thisInstant,
        });
      }
    } on FirebaseException {
      _isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: "Something went wrong. Please try again.");
    }
  }

  void deleteThisproduct(BuildContext context, String productId) {
    try {
      _isLoading = true;
      notifyListeners();
      _firestore
          .collection(DbCollectionIds.products)
          .doc(productId)
          .delete()
          .then((value) {
        context.pop();
      });
    } on FirebaseException {
      _isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
}
