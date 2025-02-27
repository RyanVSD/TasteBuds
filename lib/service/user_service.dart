import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../model/amplify/ModelProvider.dart';


Future<List<AuthUserAttribute>> getUserAttributes() async {
  try {
    final attributes = await Amplify.Auth.fetchUserAttributes();
    return attributes;
  } catch (e) {
    safePrint('Error fetching user attributes: $e');
    return const [];
  }
}

Future<String> getUsername() async {
  try {
    final user = await Amplify.Auth.getCurrentUser();
    return user.username;
  } catch (e) {
    safePrint('Error fetching user id: $e');
    return "";
  }
}

Future<List<User?>> everyUser() async {
  try {
    final firstRequest = ModelQueries.list<User>(User.classType);
    final firstResult =
        await Amplify.API.query(request: firstRequest).response;
    final firstPageData = firstResult.data;
    if (firstPageData?.items == null) {
      print("NULL PAGE: ${firstResult.errors}");
    } else {
      print("GOOD PAGE :) ${firstPageData?.items}");
    }
    return firstPageData?.items ?? <User?>[];
  } on ApiException catch (e) {
    safePrint("cooked: $e");
    return [];
  }
}

  // Returns followerCount of signed in user
  // Returns a negative value if there is an error
   Future<int> followerCount() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      final id = user.userId;
      final identifier = UserModelIdentifier(id: id);
      final request = ModelQueries.get(User.classType, identifier);
      final response = await Amplify.API.query(request: request).response;
      final userInfo = response.data;
      if (userInfo == null) {
        safePrint("Error getting follower count");
        return -1;
      }
      return userInfo.followerCount ?? -1;
    } on ApiException catch (e) {
      safePrint("fetch failed $e");
      return -1;
    }
  }

  //static Future<User> getUserProfile() async {}

