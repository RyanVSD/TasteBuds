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


/** This is an auto generated class representing the Tag type in your schema. */
class Tag extends amplify_core.Model {
  static const classType = const _TagModelType();
  final String? _value;
  final List<PostTag>? _posts;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  TagModelIdentifier get modelIdentifier {
    try {
      return TagModelIdentifier(
        value: _value!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get value {
    try {
      return _value!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<PostTag>? get posts {
    return _posts;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Tag._internal({required value, posts, createdAt, updatedAt}): _value = value, _posts = posts, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Tag({required String value, List<PostTag>? posts}) {
    return Tag._internal(
      value: value,
      posts: posts != null ? List<PostTag>.unmodifiable(posts) : posts);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tag &&
      _value == other._value &&
      DeepCollectionEquality().equals(_posts, other._posts);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Tag {");
    buffer.write("value=" + "$_value" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Tag copyWith({List<PostTag>? posts}) {
    return Tag._internal(
      value: value,
      posts: posts ?? this.posts);
  }
  
  Tag copyWithModelFieldValues({
    ModelFieldValue<List<PostTag>?>? posts
  }) {
    return Tag._internal(
      value: value,
      posts: posts == null ? this.posts : posts.value
    );
  }
  
  Tag.fromJson(Map<String, dynamic> json)  
    : _value = json['value'],
      _posts = json['posts']  is Map
        ? (json['posts']['items'] is List
          ? (json['posts']['items'] as List)
              .where((e) => e != null)
              .map((e) => PostTag.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['posts'] is List
          ? (json['posts'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => PostTag.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'value': _value, 'posts': _posts?.map((PostTag? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'value': _value,
    'posts': _posts,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TagModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TagModelIdentifier>();
  static final VALUE = amplify_core.QueryField(fieldName: "value");
  static final POSTS = amplify_core.QueryField(
    fieldName: "posts",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'PostTag'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Tag";
    modelSchemaDefinition.pluralName = "Tags";
    
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
      amplify_core.ModelIndex(fields: const ["value"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Tag.VALUE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Tag.POSTS,
      isRequired: false,
      ofModelName: 'PostTag',
      associatedKey: PostTag.TAG
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

class _TagModelType extends amplify_core.ModelType<Tag> {
  const _TagModelType();
  
  @override
  Tag fromJson(Map<String, dynamic> jsonData) {
    return Tag.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Tag';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Tag] in your schema.
 */
class TagModelIdentifier implements amplify_core.ModelIdentifier<Tag> {
  final String value;

  /** Create an instance of TagModelIdentifier using [value] the primary key. */
  const TagModelIdentifier({
    required this.value});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'value': value
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'TagModelIdentifier(value: $value)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TagModelIdentifier &&
      value == other.value;
  }
  
  @override
  int get hashCode =>
    value.hashCode;
}