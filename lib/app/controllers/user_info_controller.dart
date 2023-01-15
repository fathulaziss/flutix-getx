import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/app/models/user_model.dart';
import 'package:flutix/constants/constant.dart';
import 'package:flutix/utils/app_storage.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  final collectionUser = FirebaseFirestore.instance.collection('users');
  Rx<UserModel> dataUser = const UserModel().obs;

  void setDataUser(UserModel value) => dataUser(value);

  Future<void> getDataUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final data = await collectionUser.doc(user.uid).get();

        final dataUserUpdate = UserModel(
          balance: data['balance'] ?? 0,
          dateOfBirth: data['date_of_birth'] ?? '',
          email: data['email'] ?? '',
          fullName: data['full_name'] ?? '',
          imageProfile: data['image_profile'] ?? '',
          pinTransaction: data['pin_transaction'] ?? '',
          favoriteGenres: data['favorite_genres'] ?? [],
          userId: user.uid,
        );

        dataUser.value = dataUserUpdate;
        await AppStorage.write(
          key: CACHE_PIN,
          value: dataUser.value.pinTransaction,
        );
      }
    } catch (e) {
      logSys(e.toString());
      rethrow;
    }
  }

  Future<void> updateDataUser({required UserModel data}) async {
    try {
      await collectionUser.doc(data.userId).set(data.toJson());
    } catch (e) {
      logSys(e.toString());
    }
  }
}
