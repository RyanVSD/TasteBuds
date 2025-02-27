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


/** This is an auto generated class representing the CompletedRecipe type in your schema. */
class CompletedRecipe extends amplify_core.Model {
  static const classType = const _CompletedRecipeModelType();
  final String id;
  final amplify_core.TemporalDateTime? _completedAt;
  final int? _difficultyRating;
  final int? _tasteRating;
  final User? _user;
  final Post? _recipe;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CompletedRecipeModelIdentifier get modelIdentifier {
      return CompletedRecipeModelIdentifier(
        id: id
      );
  }
  
  amplify_core.TemporalDateTime? get completedAt {
    return _completedAt;
  }
  
  int get difficultyRating {
    try {
      return _difficultyRating!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get tasteRating {
    try {
      return _tasteRating!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User? get user {
    return _user;
  }
  
  Post? get recipe {
    return _recipe;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CompletedRecipe._internal({required this.id, completedAt, required difficultyRating, required tasteRating, user, recipe, createdAt, updatedAt}): _completedAt = completedAt, _difficultyRating = difficultyRating, _tasteRating = tasteRating, _user = user, _recipe = recipe, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CompletedRecipe({String? id, amplify_core.TemporalDateTime? completedAt, required int difficultyRating, required int tasteRating, User? user, Post? recipe}) {
    return CompletedRecipe._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      completedAt: completedAt,
      difficultyRating: difficultyRating,
      tasteRating: tasteRating,
      user: user,
      recipe: recipe);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompletedRecipe &&
      id == other.id &&
      _completedAt == other._completedAt &&
      _difficultyRating == other._difficultyRating &&
      _tasteRating == other._tasteRating &&
      _user == other._user &&
      _recipe == other._recipe;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CompletedRecipe {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("completedAt=" + (_completedAt != null ? _completedAt!.format() : "null") + ", ");
    buffer.write("difficultyRating=" + (_difficultyRating != null ? _difficultyRating!.toString() : "null") + ", ");
    buffer.write("tasteRating=" + (_tasteRating != null ? _tasteRating!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("recipe=" + (_recipe != null ? _recipe!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CompletedRecipe copyWith({amplify_core.TemporalDateTime? completedAt, int? difficultyRating, int? tasteRating, User? user, Post? recipe}) {
    return CompletedRecipe._internal(
      id: id,
      completedAt: completedAt ?? this.completedAt,
      difficultyRating: difficultyRating ?? this.difficultyRating,
      tasteRating: tasteRating ?? this.tasteRating,
      user: user ?? this.user,
      recipe: recipe ?? this.recipe);
  }
  
  CompletedRecipe copyWithModelFieldValues({
    ModelFieldValue<amplify_core.TemporalDateTime?>? completedAt,
    ModelFieldValue<int>? difficultyRating,
    ModelFieldValue<int>? tasteRating,
    ModelFieldValue<User?>? user,
    ModelFieldValue<Post?>? recipe
  }) {
    return CompletedRecipe._internal(
      id: id,
      completedAt: completedAt == null ? this.completedAt : completedAt.value,
      difficultyRating: difficultyRating == null ? this.difficultyRating : difficultyRating.value,
      tasteRating: tasteRating == null ? this.tasteRating : tasteRating.value,
      user: user == null ? this.user : user.value,
      recipe: recipe == null ? this.recipe : recipe.value
    );
  }
  
  CompletedRecipe.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _completedAt = json['completedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['completedAt']) : null,
      _difficultyRating = (json['difficultyRating'] as num?)?.toInt(),
      _tasteRating = (json['tasteRating'] as num?)?.toInt(),
      _user = json['user'] != null
        ? json['user']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null,
      _recipe = json['recipe'] != null
        ? json['recipe']['serializedData'] != null
          ? Post.fromJson(new Map<String, dynamic>.from(json['recipe']['serializedData']))
          : Post.fromJson(new Map<String, dynamic>.from(json['recipe']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'completedAt': _completedAt?.format(), 'difficultyRating': _difficultyRating, 'tasteRating': _tasteRating, 'user': _user?.toJson(), 'recipe': _recipe?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'completedAt': _completedAt,
    'difficultyRating': _difficultyRating,
    'tasteRating': _tasteRating,
    'user': _user,
    'recipe': _recipe,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CompletedRecipeModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CompletedRecipeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final COMPLETEDAT = amplify_core.QueryField(fieldName: "completedAt");
  static final DIFFICULTYRATING = amplify_core.QueryField(fieldName: "difficultyRating");
  static final TASTERATING = amplify_core.QueryField(fieldName: "tasteRating");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final RECIPE = amplify_core.QueryField(
    fieldName: "recipe",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Post'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CompletedRecipe";
    modelSchemaDefinition.pluralName = "CompletedRecipes";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CompletedRecipe.COMPLETEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CompletedRecipe.DIFFICULTYRATING,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CompletedRecipe.TASTERATING,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: CompletedRecipe.USER,
      isRequired: false,
      targetNames: ['userId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: CompletedRecipe.RECIPE,
      isRequired: false,
      targetNames: ['recipeId'],
      ofModelName: 'Post'
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

class _CompletedRecipeModelType extends amplify_core.ModelType<CompletedRecipe> {
  const _CompletedRecipeModelType();
  
  @override
  CompletedRecipe fromJson(Map<String, dynamic> jsonData) {
    return CompletedRecipe.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CompletedRecipe';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CompletedRecipe] in your schema.
 */
class CompletedRecipeModelIdentifier implements amplify_core.ModelIdentifier<CompletedRecipe> {
  final String id;

  /** Create an instance of CompletedRecipeModelIdentifier using [id] the primary key. */
  const CompletedRecipeModelIdentifier({
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
  String toString() => 'CompletedRecipeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CompletedRecipeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}