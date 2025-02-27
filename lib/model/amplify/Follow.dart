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


/** This is an auto generated class representing the Follow type in your schema. */
class Follow extends amplify_core.Model {
  static const classType = const _FollowModelType();
  final String id;
  final User? _follower;
  final User? _followee;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FollowModelIdentifier get modelIdentifier {
      return FollowModelIdentifier(
        id: id
      );
  }
  
  User? get follower {
    return _follower;
  }
  
  User? get followee {
    return _followee;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Follow._internal({required this.id, follower, followee, createdAt, updatedAt}): _follower = follower, _followee = followee, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Follow({String? id, User? follower, User? followee}) {
    return Follow._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      follower: follower,
      followee: followee);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Follow &&
      id == other.id &&
      _follower == other._follower &&
      _followee == other._followee;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Follow {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("follower=" + (_follower != null ? _follower!.toString() : "null") + ", ");
    buffer.write("followee=" + (_followee != null ? _followee!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Follow copyWith({User? follower, User? followee}) {
    return Follow._internal(
      id: id,
      follower: follower ?? this.follower,
      followee: followee ?? this.followee);
  }
  
  Follow copyWithModelFieldValues({
    ModelFieldValue<User?>? follower,
    ModelFieldValue<User?>? followee
  }) {
    return Follow._internal(
      id: id,
      follower: follower == null ? this.follower : follower.value,
      followee: followee == null ? this.followee : followee.value
    );
  }
  
  Follow.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _follower = json['follower'] != null
        ? json['follower']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['follower']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['follower']))
        : null,
      _followee = json['followee'] != null
        ? json['followee']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['followee']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['followee']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'follower': _follower?.toJson(), 'followee': _followee?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'follower': _follower,
    'followee': _followee,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FollowModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FollowModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final FOLLOWER = amplify_core.QueryField(
    fieldName: "follower",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final FOLLOWEE = amplify_core.QueryField(
    fieldName: "followee",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Follow";
    modelSchemaDefinition.pluralName = "Follows";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Follow.FOLLOWER,
      isRequired: false,
      targetNames: ['followerId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Follow.FOLLOWEE,
      isRequired: false,
      targetNames: ['followeeId'],
      ofModelName: 'User'
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

class _FollowModelType extends amplify_core.ModelType<Follow> {
  const _FollowModelType();
  
  @override
  Follow fromJson(Map<String, dynamic> jsonData) {
    return Follow.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Follow';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Follow] in your schema.
 */
class FollowModelIdentifier implements amplify_core.ModelIdentifier<Follow> {
  final String id;

  /** Create an instance of FollowModelIdentifier using [id] the primary key. */
  const FollowModelIdentifier({
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
  String toString() => 'FollowModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FollowModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}