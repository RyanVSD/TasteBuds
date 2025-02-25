import 'package:amplify_flutter/amplify_flutter.dart';
import '../model/amplify/ModelProvider.dart';

class Database {
  static Future<void> getUserAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      for (final attribute in attributes) {
        print('${attribute.userAttributeKey}: ${attribute.value}');
      }
    } catch (e) {
      print('Error fetching user attributes: $e');
    }
    return;
  }

  static Future<void> getUserId() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      print(user.userId);
    } catch (e) {
      print('Error fetching user id: $e');
    }
    return;
  }

  static Future<void> getUsername() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      print(user.username);
    } catch (e) {
      print('Error fetching user id: $e');
    }
    return;
  }

  //static Future<User> getUserProfile() async {}
}
