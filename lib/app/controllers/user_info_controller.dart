import 'package:flutix/app/models/user_model.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  Rx<UserModel> dataUser = const UserModel().obs;
}
