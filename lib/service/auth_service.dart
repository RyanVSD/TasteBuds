import 'package:amplify_flutter/amplify_flutter.dart';

class AuthService {
  /// Signs in a user with email and password
  static Future<SignInResult?> signIn(String email, String password) async {
    try {
      final result =
          await Amplify.Auth.signIn(username: email, password: password);
      return result;
    } on AuthException catch (e) {
      print('Sign-in failed: ${e.message}');
      return null;
    }
  }

  static Future<SignUpResult?> signUp(String email, String password,
      Map<AuthUserAttributeKey, String> attributes) async {
    try {
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(userAttributes: attributes),
      );
      return result;
    } on AuthException catch (e) {
      print('Sign-up failed: ${e.message}');
      return null;
    }
  }

  /// Confirms a multi-factor authentication (MFA) challenge
  static Future<SignInResult?> confirmMFA(String confirmationCode) async {
    try {
      final result =
          await Amplify.Auth.confirmSignIn(confirmationValue: confirmationCode);
      return result;
    } on AuthException catch (e) {
      print('MFA confirmation failed: ${e.message}');
      return null;
    }
  }

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

  /// Signs out the current user
  static Future<void> signOut({bool globalSignOut = false}) async {
    try {
      await Amplify.Auth.signOut(
          options: SignOutOptions(globalSignOut: globalSignOut));
      print('User signed out successfully');
    } on AuthException catch (e) {
      print('Sign-out failed: ${e.message}');
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
