import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/service/user_service.dart' as service;

class UserModel extends ChangeNotifier {
  User? user;
  UserModel();
    
  void userLogin() async {
    AuthSession? session = await service.getAuthSession();
    if (session != null && session.isSignedIn) {
      user = await service.getCurrentUser();
    }
    notifyListeners();
  }

}
