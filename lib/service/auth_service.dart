import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';


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

  static Future<String> getUserId() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      return user.userId;
    } catch (e) {
      print('Error fetching user id: $e');
      return "";
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
Future<void> signOutCurrentUser() async {
  final result = await Amplify.Auth.signOut();
  if (result is CognitoCompleteSignOut) {
    safePrint('Sign out completed successfully');
  } else if (result is CognitoFailedSignOut) {
    safePrint('Error signing user out: ${result.exception.message}');
  }
}