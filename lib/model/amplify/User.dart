/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the User type in your schema. */
class User extends amplify_core.Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _username;
  final String? _preferredUsername;
  final int? _followerCount;
  final int? _followingCount;
  final int? _completedRecipeCount;
  final List<LikePost>? _likes;
  final List<FavoritePost>? _favorites;
  final List<Follow>? _following;
  final List<Follow>? _followers;
  final List<Post>? _posts;
  final List<CompletedRecipe>? _completed;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelIdentifier get modelIdentifier {
      return UserModelIdentifier(
        id: id
      );
  }
  
  String get username {
    try {
      return _username!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get preferredUsername {
    try {
      return _preferredUsername!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get followerCount {
    try {
      return _followerCount!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get followingCount {
    try {
      return _followingCount!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get completedRecipeCount {
    try {
      return _completedRecipeCount!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<LikePost>? get likes {
    return _likes;
  }
  
  List<FavoritePost>? get favorites {
    return _favorites;
  }
  
  List<Follow>? get following {
    return _following;
  }
  
  List<Follow>? get followers {
    return _followers;
  }
  
  List<Post>? get posts {
    return _posts;
  }
  
  List<CompletedRecipe>? get completed {
    return _completed;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, required username, required preferredUsername, required followerCount, required followingCount, required completedRecipeCount, likes, favorites, following, followers, posts, completed, createdAt, updatedAt}): _username = username, _preferredUsername = preferredUsername, _followerCount = followerCount, _followingCount = followingCount, _completedRecipeCount = completedRecipeCount, _likes = likes, _favorites = favorites, _following = following, _followers = followers, _posts = posts, _completed = completed, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, required String username, required String preferredUsername, required int followerCount, required int followingCount, required int completedRecipeCount, List<LikePost>? likes, List<FavoritePost>? favorites, List<Follow>? following, List<Follow>? followers, List<Post>? posts, List<CompletedRecipe>? completed}) {
    return User._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      username: username,
      preferredUsername: preferredUsername,
      followerCount: followerCount,
      followingCount: followingCount,
      completedRecipeCount: completedRecipeCount,
      likes: likes != null ? List<LikePost>.unmodifiable(likes) : likes,
      favorites: favorites != null ? List<FavoritePost>.unmodifiable(favorites) : favorites,
      following: following != null ? List<Follow>.unmodifiable(following) : following,
      followers: followers != null ? List<Follow>.unmodifiable(followers) : followers,
      posts: posts != null ? List<Post>.unmodifiable(posts) : posts,
      completed: completed != null ? List<CompletedRecipe>.unmodifiable(completed) : completed);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _username == other._username &&
      _preferredUsername == other._preferredUsername &&
      _followerCount == other._followerCount &&
      _followingCount == other._followingCount &&
      _completedRecipeCount == other._completedRecipeCount &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      DeepCollectionEquality().equals(_favorites, other._favorites) &&
      DeepCollectionEquality().equals(_following, other._following) &&
      DeepCollectionEquality().equals(_followers, other._followers) &&
      DeepCollectionEquality().equals(_posts, other._posts) &&
      DeepCollectionEquality().equals(_completed, other._completed);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("preferredUsername=" + "$_preferredUsername" + ", ");
    buffer.write("followerCount=" + (_followerCount != null ? _followerCount!.toString() : "null") + ", ");
    buffer.write("followingCount=" + (_followingCount != null ? _followingCount!.toString() : "null") + ", ");
    buffer.write("completedRecipeCount=" + (_completedRecipeCount != null ? _completedRecipeCount!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? username, String? preferredUsername, int? followerCount, int? followingCount, int? completedRecipeCount, List<LikePost>? likes, List<FavoritePost>? favorites, List<Follow>? following, List<Follow>? followers, List<Post>? posts, List<CompletedRecipe>? completed}) {
    return User._internal(
      id: id,
      username: username ?? this.username,
      preferredUsername: preferredUsername ?? this.preferredUsername,
      followerCount: followerCount ?? this.followerCount,
      followingCount: followingCount ?? this.followingCount,
      completedRecipeCount: completedRecipeCount ?? this.completedRecipeCount,
      likes: likes ?? this.likes,
      favorites: favorites ?? this.favorites,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      posts: posts ?? this.posts,
      completed: completed ?? this.completed);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String>? username,
    ModelFieldValue<String>? preferredUsername,
    ModelFieldValue<int>? followerCount,
    ModelFieldValue<int>? followingCount,
    ModelFieldValue<int>? completedRecipeCount,
    ModelFieldValue<List<LikePost>?>? likes,
    ModelFieldValue<List<FavoritePost>?>? favorites,
    ModelFieldValue<List<Follow>?>? following,
    ModelFieldValue<List<Follow>?>? followers,
    ModelFieldValue<List<Post>?>? posts,
    ModelFieldValue<List<CompletedRecipe>?>? completed
  }) {
    return User._internal(
      id: id,
      username: username == null ? this.username : username.value,
      preferredUsername: preferredUsername == null ? this.preferredUsername : preferredUsername.value,
      followerCount: followerCount == null ? this.followerCount : followerCount.value,
      followingCount: followingCount == null ? this.followingCount : followingCount.value,
      completedRecipeCount: completedRecipeCount == null ? this.completedRecipeCount : completedRecipeCount.value,
      likes: likes == null ? this.likes : likes.value,
      favorites: favorites == null ? this.favorites : favorites.value,
      following: following == null ? this.following : following.value,
      followers: followers == null ? this.followers : followers.value,
      posts: posts == null ? this.posts : posts.value,
      completed: completed == null ? this.completed : completed.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _preferredUsername = json['preferredUsername'],
      _followerCount = (json['followerCount'] as num?)?.toInt(),
      _followingCount = (json['followingCount'] as num?)?.toInt(),
      _completedRecipeCount = (json['completedRecipeCount'] as num?)?.toInt(),
      _likes = json['likes']  is Map
        ? (json['likes']['items'] is List
          ? (json['likes']['items'] as List)
              .where((e) => e != null)
              .map((e) => LikePost.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['likes'] is List
          ? (json['likes'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => LikePost.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _favorites = json['favorites']  is Map
        ? (json['favorites']['items'] is List
          ? (json['favorites']['items'] as List)
              .where((e) => e != null)
              .map((e) => FavoritePost.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['favorites'] is List
          ? (json['favorites'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => FavoritePost.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _following = json['following']  is Map
        ? (json['following']['items'] is List
          ? (json['following']['items'] as List)
              .where((e) => e != null)
              .map((e) => Follow.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['following'] is List
          ? (json['following'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Follow.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _followers = json['followers']  is Map
        ? (json['followers']['items'] is List
          ? (json['followers']['items'] as List)
              .where((e) => e != null)
              .map((e) => Follow.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['followers'] is List
          ? (json['followers'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Follow.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _posts = json['posts']  is Map
        ? (json['posts']['items'] is List
          ? (json['posts']['items'] as List)
              .where((e) => e != null)
              .map((e) => Post.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['posts'] is List
          ? (json['posts'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Post.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _completed = json['completed']  is Map
        ? (json['completed']['items'] is List
          ? (json['completed']['items'] as List)
              .where((e) => e != null)
              .map((e) => CompletedRecipe.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['completed'] is List
          ? (json['completed'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => CompletedRecipe.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'preferredUsername': _preferredUsername, 'followerCount': _followerCount, 'followingCount': _followingCount, 'completedRecipeCount': _completedRecipeCount, 'likes': _likes?.map((LikePost? e) => e?.toJson()).toList(), 'favorites': _favorites?.map((FavoritePost? e) => e?.toJson()).toList(), 'following': _following?.map((Follow? e) => e?.toJson()).toList(), 'followers': _followers?.map((Follow? e) => e?.toJson()).toList(), 'posts': _posts?.map((Post? e) => e?.toJson()).toList(), 'completed': _completed?.map((CompletedRecipe? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'username': _username,
    'preferredUsername': _preferredUsername,
    'followerCount': _followerCount,
    'followingCount': _followingCount,
    'completedRecipeCount': _completedRecipeCount,
    'likes': _likes,
    'favorites': _favorites,
    'following': _following,
    'followers': _followers,
    'posts': _posts,
    'completed': _completed,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final PREFERREDUSERNAME = amplify_core.QueryField(fieldName: "preferredUsername");
  static final FOLLOWERCOUNT = amplify_core.QueryField(fieldName: "followerCount");
  static final FOLLOWINGCOUNT = amplify_core.QueryField(fieldName: "followingCount");
  static final COMPLETEDRECIPECOUNT = amplify_core.QueryField(fieldName: "completedRecipeCount");
  static final LIKES = amplify_core.QueryField(
    fieldName: "likes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'LikePost'));
  static final FAVORITES = amplify_core.QueryField(
    fieldName: "favorites",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FavoritePost'));
  static final FOLLOWING = amplify_core.QueryField(
    fieldName: "following",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Follow'));
  static final FOLLOWERS = amplify_core.QueryField(
    fieldName: "followers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Follow'));
  static final POSTS = amplify_core.QueryField(
    fieldName: "posts",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Post'));
  static final COMPLETED = amplify_core.QueryField(
    fieldName: "completed",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CompletedRecipe'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PREFERREDUSERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.FOLLOWERCOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.FOLLOWINGCOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.COMPLETEDRECIPECOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.LIKES,
      isRequired: false,
      ofModelName: 'LikePost',
      associatedKey: LikePost.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.FAVORITES,
      isRequired: false,
      ofModelName: 'FavoritePost',
      associatedKey: FavoritePost.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.FOLLOWING,
      isRequired: false,
      ofModelName: 'Follow',
      associatedKey: Follow.FOLLOWER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.FOLLOWERS,
      isRequired: false,
      ofModelName: 'Follow',
      associatedKey: Follow.FOLLOWEE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.POSTS,
      isRequired: false,
      ofModelName: 'Post',
      associatedKey: Post.AUTHOR
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.COMPLETED,
      isRequired: false,
      ofModelName: 'CompletedRecipe',
      associatedKey: CompletedRecipe.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelType extends amplify_core.ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [User] in your schema.
 */
class UserModelIdentifier implements amplify_core.ModelIdentifier<User> {
  final String id;

  /** Create an instance of UserModelIdentifier using [id] the primary key. */
  const UserModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'UserModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}