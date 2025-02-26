import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../model/amplify/ModelProvider.dart';

class Database {
  static Future<List<AuthUserAttribute>> getUserAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      return attributes;
    } catch (e) {
      print('Error fetching user attributes: $e');
      return const [];
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

  static Future<String> getUsername() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      return user.username;
    } catch (e) {
      print('Error fetching user id: $e');
      return "";
    }
  }

  static Future<List<Post?>> getPosts(int limit) async {
    try {
      final firstRequest =
          ModelQueries.list<Post>(Post.classType, limit: limit);
      final firstResult =
          await Amplify.API.query(request: firstRequest).response;
      final firstPageData = firstResult.data;
      return firstPageData?.items ?? <Post?>[];
    } on ApiException catch (e) {
      print("Error fetching posts: $e");
      return const [];
    }
  }

  static Future<Post?> getPost(String postId) async {
    try {
      final queryPredicate = Post.ID.eq(postId);
      final request = ModelQueries.list(Post.classType, where: queryPredicate);
      final response = await Amplify.API.query(request: request).response;
      final posts = response.data?.items;
      if (posts == null) {
        print("Errors: ${response.errors}");
        return null;
      } else {
        return posts[0];
      }
    } on ApiException catch (e) {
      print("error fetching post: $e");
      return null;
    }
  }

  static Future<void> createPost(Post post) async {
    try {
      final request = ModelMutations.create(post);
      final response = await Amplify.API.mutate(request: request).response;
      final createdPost = response.data;
      if (createdPost == null) {
        print('error: ${response.errors}');
        return;
      }
      print('Mutation result: ${createdPost.title}');
    } on ApiException catch (e) {
      print("Mutation failed: $e");
    }
  }

  static Future<int> followerCount() async {
    try {} on ApiException catch (e) {
      print("fetch failed $e");
    }
  }

  //static Future<User> getUserProfile() async {}
}
