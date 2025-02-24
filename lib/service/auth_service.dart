import 'package:amplify_flutter/amplify_flutter.dart';

class AuthService {
  /// Fetches the currently signed-in user's attributes
  static Future<Map<AuthUserAttributeKey, String>?>
      fetchUserAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      return {for (var attr in attributes) attr.userAttributeKey: attr.value};
    } on AuthException catch (e) {
      print('Failed to fetch user attributes: ${e.message}');
      return null;
    }
  }

  /// Checks if a user is currently signed in
  static Future<bool> isUserSignedIn() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn;
    } on AuthException catch (e) {
      print('Failed to check sign-in status: ${e.message}');
      return false;
    }
  }

  Future<void> fetchAuthSession() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      safePrint('User is signed in: ${result.isSignedIn}');
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
    }
  }
}
