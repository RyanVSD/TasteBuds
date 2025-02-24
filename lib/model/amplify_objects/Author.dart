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


/** This is an auto generated class representing the Author type in your schema. */
class Author extends amplify_core.Model {
  static const classType = const _AuthorModelType();
  final String id;
  final String? _username;
  final List<FavoritePost>? _favorites;
  final List<Post>? _posts;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AuthorModelIdentifier get modelIdentifier {
      return AuthorModelIdentifier(
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
  
  List<FavoritePost>? get favorites {
    return _favorites;
  }
  
  List<Post>? get posts {
    return _posts;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Author._internal({required this.id, required username, favorites, posts, createdAt, updatedAt}): _username = username, _favorites = favorites, _posts = posts, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Author({String? id, required String username, List<FavoritePost>? favorites, List<Post>? posts}) {
    return Author._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      username: username,
      favorites: favorites != null ? List<FavoritePost>.unmodifiable(favorites) : favorites,
      posts: posts != null ? List<Post>.unmodifiable(posts) : posts);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Author &&
      id == other.id &&
      _username == other._username &&
      DeepCollectionEquality().equals(_favorites, other._favorites) &&
      DeepCollectionEquality().equals(_posts, other._posts);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Author {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Author copyWith({String? username, List<FavoritePost>? favorites, List<Post>? posts}) {
    return Author._internal(
      id: id,
      username: username ?? this.username,
      favorites: favorites ?? this.favorites,
      posts: posts ?? this.posts);
  }
  
  Author copyWithModelFieldValues({
    ModelFieldValue<String>? username,
    ModelFieldValue<List<FavoritePost>?>? favorites,
    ModelFieldValue<List<Post>?>? posts
  }) {
    return Author._internal(
      id: id,
      username: username == null ? this.username : username.value,
      favorites: favorites == null ? this.favorites : favorites.value,
      posts: posts == null ? this.posts : posts.value
    );
  }
  
  Author.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
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
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'favorites': _favorites?.map((FavoritePost? e) => e?.toJson()).toList(), 'posts': _posts?.map((Post? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'username': _username,
    'favorites': _favorites,
    'posts': _posts,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AuthorModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AuthorModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final FAVORITES = amplify_core.QueryField(
    fieldName: "favorites",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FavoritePost'));
  static final POSTS = amplify_core.QueryField(
    fieldName: "posts",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Post'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Author";
    modelSchemaDefinition.pluralName = "Authors";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        provider: amplify_core.AuthRuleProvider.IAM,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Author.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Author.FAVORITES,
      isRequired: false,
      ofModelName: 'FavoritePost',
      associatedKey: FavoritePost.AUTHOR
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Author.POSTS,
      isRequired: false,
      ofModelName: 'Post',
      associatedKey: Post.AUTHOR
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

class _AuthorModelType extends amplify_core.ModelType<Author> {
  const _AuthorModelType();
  
  @override
  Author fromJson(Map<String, dynamic> jsonData) {
    return Author.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Author';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Author] in your schema.
 */
class AuthorModelIdentifier implements amplify_core.ModelIdentifier<Author> {
  final String id;

  /** Create an instance of AuthorModelIdentifier using [id] the primary key. */
  const AuthorModelIdentifier({
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
  String toString() => 'AuthorModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AuthorModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}