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


/** This is an auto generated class representing the Post type in your schema. */
class Post extends amplify_core.Model {
  static const classType = const _PostModelType();
  final String id;
  final String? _title;
  final String? _description;
  final String? _imageUrl;
  final List<String>? _steps;
  final amplify_core.TemporalDateTime? _uploadTime;
  final int? _likes;
  final int? _favorites;
  final double? _difficulty;
  final double? _price;
  final List<Ingredient>? _ingredients;
  final User? _author;
  final List<FavoritePost>? _favoritedBy;
  final List<LikePost>? _likedBy;
  final List<PostTag>? _tags;
  final List<CompletedRecipe>? _completed;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PostModelIdentifier get modelIdentifier {
      return PostModelIdentifier(
        id: id
      );
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get imageUrl {
    try {
      return _imageUrl!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get steps {
    try {
      return _steps!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get uploadTime {
    return _uploadTime;
  }
  
  int get likes {
    try {
      return _likes!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get favorites {
    try {
      return _favorites!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get difficulty {
    try {
      return _difficulty!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Ingredient> get ingredients {
    try {
      return _ingredients!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User? get author {
    return _author;
  }
  
  List<FavoritePost>? get favoritedBy {
    return _favoritedBy;
  }
  
  List<LikePost>? get likedBy {
    return _likedBy;
  }
  
  List<PostTag>? get tags {
    return _tags;
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
  
  const Post._internal({required this.id, required title, required description, required imageUrl, required steps, uploadTime, required likes, required favorites, required difficulty, required price, required ingredients, author, favoritedBy, likedBy, tags, completed, createdAt, updatedAt}): _title = title, _description = description, _imageUrl = imageUrl, _steps = steps, _uploadTime = uploadTime, _likes = likes, _favorites = favorites, _difficulty = difficulty, _price = price, _ingredients = ingredients, _author = author, _favoritedBy = favoritedBy, _likedBy = likedBy, _tags = tags, _completed = completed, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Post({String? id, required String title, required String description, required String imageUrl, required List<String> steps, amplify_core.TemporalDateTime? uploadTime, required int likes, required int favorites, required double difficulty, required double price, required List<Ingredient> ingredients, User? author, List<FavoritePost>? favoritedBy, List<LikePost>? likedBy, List<PostTag>? tags, List<CompletedRecipe>? completed}) {
    return Post._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      steps: steps != null ? List<String>.unmodifiable(steps) : steps,
      uploadTime: uploadTime,
      likes: likes,
      favorites: favorites,
      difficulty: difficulty,
      price: price,
      ingredients: ingredients != null ? List<Ingredient>.unmodifiable(ingredients) : ingredients,
      author: author,
      favoritedBy: favoritedBy != null ? List<FavoritePost>.unmodifiable(favoritedBy) : favoritedBy,
      likedBy: likedBy != null ? List<LikePost>.unmodifiable(likedBy) : likedBy,
      tags: tags != null ? List<PostTag>.unmodifiable(tags) : tags,
      completed: completed != null ? List<CompletedRecipe>.unmodifiable(completed) : completed);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _imageUrl == other._imageUrl &&
      DeepCollectionEquality().equals(_steps, other._steps) &&
      _uploadTime == other._uploadTime &&
      _likes == other._likes &&
      _favorites == other._favorites &&
      _difficulty == other._difficulty &&
      _price == other._price &&
      DeepCollectionEquality().equals(_ingredients, other._ingredients) &&
      _author == other._author &&
      DeepCollectionEquality().equals(_favoritedBy, other._favoritedBy) &&
      DeepCollectionEquality().equals(_likedBy, other._likedBy) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      DeepCollectionEquality().equals(_completed, other._completed);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("steps=" + (_steps != null ? _steps!.toString() : "null") + ", ");
    buffer.write("uploadTime=" + (_uploadTime != null ? _uploadTime!.format() : "null") + ", ");
    buffer.write("likes=" + (_likes != null ? _likes!.toString() : "null") + ", ");
    buffer.write("favorites=" + (_favorites != null ? _favorites!.toString() : "null") + ", ");
    buffer.write("difficulty=" + (_difficulty != null ? _difficulty!.toString() : "null") + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("ingredients=" + (_ingredients != null ? _ingredients!.toString() : "null") + ", ");
    buffer.write("author=" + (_author != null ? _author!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? title, String? description, String? imageUrl, List<String>? steps, amplify_core.TemporalDateTime? uploadTime, int? likes, int? favorites, double? difficulty, double? price, List<Ingredient>? ingredients, User? author, List<FavoritePost>? favoritedBy, List<LikePost>? likedBy, List<PostTag>? tags, List<CompletedRecipe>? completed}) {
    return Post._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      steps: steps ?? this.steps,
      uploadTime: uploadTime ?? this.uploadTime,
      likes: likes ?? this.likes,
      favorites: favorites ?? this.favorites,
      difficulty: difficulty ?? this.difficulty,
      price: price ?? this.price,
      ingredients: ingredients ?? this.ingredients,
      author: author ?? this.author,
      favoritedBy: favoritedBy ?? this.favoritedBy,
      likedBy: likedBy ?? this.likedBy,
      tags: tags ?? this.tags,
      completed: completed ?? this.completed);
  }
  
  Post copyWithModelFieldValues({
    ModelFieldValue<String>? title,
    ModelFieldValue<String>? description,
    ModelFieldValue<String>? imageUrl,
    ModelFieldValue<List<String>?>? steps,
    ModelFieldValue<amplify_core.TemporalDateTime?>? uploadTime,
    ModelFieldValue<int>? likes,
    ModelFieldValue<int>? favorites,
    ModelFieldValue<double>? difficulty,
    ModelFieldValue<double>? price,
    ModelFieldValue<List<Ingredient>?>? ingredients,
    ModelFieldValue<User?>? author,
    ModelFieldValue<List<FavoritePost>?>? favoritedBy,
    ModelFieldValue<List<LikePost>?>? likedBy,
    ModelFieldValue<List<PostTag>?>? tags,
    ModelFieldValue<List<CompletedRecipe>?>? completed
  }) {
    return Post._internal(
      id: id,
      title: title == null ? this.title : title.value,
      description: description == null ? this.description : description.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      steps: steps == null ? this.steps : steps.value,
      uploadTime: uploadTime == null ? this.uploadTime : uploadTime.value,
      likes: likes == null ? this.likes : likes.value,
      favorites: favorites == null ? this.favorites : favorites.value,
      difficulty: difficulty == null ? this.difficulty : difficulty.value,
      price: price == null ? this.price : price.value,
      ingredients: ingredients == null ? this.ingredients : ingredients.value,
      author: author == null ? this.author : author.value,
      favoritedBy: favoritedBy == null ? this.favoritedBy : favoritedBy.value,
      likedBy: likedBy == null ? this.likedBy : likedBy.value,
      tags: tags == null ? this.tags : tags.value,
      completed: completed == null ? this.completed : completed.value
    );
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _imageUrl = json['imageUrl'],
      _steps = json['steps']?.cast<String>(),
      _uploadTime = json['uploadTime'] != null ? amplify_core.TemporalDateTime.fromString(json['uploadTime']) : null,
      _likes = (json['likes'] as num?)?.toInt(),
      _favorites = (json['favorites'] as num?)?.toInt(),
      _difficulty = (json['difficulty'] as num?)?.toDouble(),
      _price = (json['price'] as num?)?.toDouble(),
      _ingredients = json['ingredients'] is List
        ? (json['ingredients'] as List)
          .where((e) => e != null)
          .map((e) => Ingredient.fromJson(new Map<String, dynamic>.from(e['serializedData'] ?? e)))
          .toList()
        : null,
      _author = json['author'] != null
        ? json['author']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['author']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['author']))
        : null,
      _favoritedBy = json['favoritedBy']  is Map
        ? (json['favoritedBy']['items'] is List
          ? (json['favoritedBy']['items'] as List)
              .where((e) => e != null)
              .map((e) => FavoritePost.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['favoritedBy'] is List
          ? (json['favoritedBy'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => FavoritePost.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _likedBy = json['likedBy']  is Map
        ? (json['likedBy']['items'] is List
          ? (json['likedBy']['items'] as List)
              .where((e) => e != null)
              .map((e) => LikePost.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['likedBy'] is List
          ? (json['likedBy'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => LikePost.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _tags = json['tags']  is Map
        ? (json['tags']['items'] is List
          ? (json['tags']['items'] as List)
              .where((e) => e != null)
              .map((e) => PostTag.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['tags'] is List
          ? (json['tags'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => PostTag.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
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
    'id': id, 'title': _title, 'description': _description, 'imageUrl': _imageUrl, 'steps': _steps, 'uploadTime': _uploadTime?.format(), 'likes': _likes, 'favorites': _favorites, 'difficulty': _difficulty, 'price': _price, 'ingredients': _ingredients?.map((Ingredient? e) => e?.toJson()).toList(), 'author': _author?.toJson(), 'favoritedBy': _favoritedBy?.map((FavoritePost? e) => e?.toJson()).toList(), 'likedBy': _likedBy?.map((LikePost? e) => e?.toJson()).toList(), 'tags': _tags?.map((PostTag? e) => e?.toJson()).toList(), 'completed': _completed?.map((CompletedRecipe? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'description': _description,
    'imageUrl': _imageUrl,
    'steps': _steps,
    'uploadTime': _uploadTime,
    'likes': _likes,
    'favorites': _favorites,
    'difficulty': _difficulty,
    'price': _price,
    'ingredients': _ingredients,
    'author': _author,
    'favoritedBy': _favoritedBy,
    'likedBy': _likedBy,
    'tags': _tags,
    'completed': _completed,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PostModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PostModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final STEPS = amplify_core.QueryField(fieldName: "steps");
  static final UPLOADTIME = amplify_core.QueryField(fieldName: "uploadTime");
  static final LIKES = amplify_core.QueryField(fieldName: "likes");
  static final FAVORITES = amplify_core.QueryField(fieldName: "favorites");
  static final DIFFICULTY = amplify_core.QueryField(fieldName: "difficulty");
  static final PRICE = amplify_core.QueryField(fieldName: "price");
  static final INGREDIENTS = amplify_core.QueryField(fieldName: "ingredients");
  static final AUTHOR = amplify_core.QueryField(
    fieldName: "author",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final FAVORITEDBY = amplify_core.QueryField(
    fieldName: "favoritedBy",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FavoritePost'));
  static final LIKEDBY = amplify_core.QueryField(
    fieldName: "likedBy",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'LikePost'));
  static final TAGS = amplify_core.QueryField(
    fieldName: "tags",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'PostTag'));
  static final COMPLETED = amplify_core.QueryField(
    fieldName: "completed",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CompletedRecipe'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
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
      key: Post.TITLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.DESCRIPTION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.IMAGEURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.STEPS,
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.UPLOADTIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.LIKES,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.FAVORITES,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.DIFFICULTY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.PRICE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'ingredients',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Ingredient')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Post.AUTHOR,
      isRequired: false,
      targetNames: ['authorId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Post.FAVORITEDBY,
      isRequired: false,
      ofModelName: 'FavoritePost',
      associatedKey: FavoritePost.POST
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Post.LIKEDBY,
      isRequired: false,
      ofModelName: 'LikePost',
      associatedKey: LikePost.POST
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Post.TAGS,
      isRequired: false,
      ofModelName: 'PostTag',
      associatedKey: PostTag.POST
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Post.COMPLETED,
      isRequired: false,
      ofModelName: 'CompletedRecipe',
      associatedKey: CompletedRecipe.RECIPE
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

class _PostModelType extends amplify_core.ModelType<Post> {
  const _PostModelType();
  
  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Post';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Post] in your schema.
 */
class PostModelIdentifier implements amplify_core.ModelIdentifier<Post> {
  final String id;

  /** Create an instance of PostModelIdentifier using [id] the primary key. */
  const PostModelIdentifier({
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
  String toString() => 'PostModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PostModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}