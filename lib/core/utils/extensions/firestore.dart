import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/data/models/user_model.dart';

extension UserDocumentReferenceExtension on FirebaseFirestore {
  DocumentReference<UserModel> userRef(String userId) {
    return collection(DbCollectionIds.users)
        .doc(userId)
        .withConverter<UserModel>(
          fromFirestore: (e, getOption) => UserModel.fromMap(e.data() ?? {}),
          toFirestore: (user, setOption) => user.toMap(),
        );
  }
}
