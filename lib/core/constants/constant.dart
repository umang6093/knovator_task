import 'package:get/get.dart';

class Constant {
  Constant._();

  /// App Config .....
  static Rx<UserType> userType = UserType.buyer.obs;

  static bool get isBuyer => userType.value == UserType.buyer;
  static bool get isSeller => userType.value == UserType.seller;
}

enum UserType { buyer, seller }
