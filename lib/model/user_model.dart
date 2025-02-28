import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/service/user_service.dart' as service;

// Provide global access to the user data once they logged in
class UserModel extends ChangeNotifier {
  User? user;
  UserModel();
    
  void userLogin() async {
    userLogout();
    if (user == null) {
      AuthSession? session = await service.getAuthSession();
      if (session != null && session.isSignedIn) {
        user = await service.getCurrentUser();
      }
      notifyListeners();
    }
  }

  void userLogout() {
    user = null;
  }

  Future<User?> getUser(String userId) async {
    return service.getUser(userId);
  }

}
