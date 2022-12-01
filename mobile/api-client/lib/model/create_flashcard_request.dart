//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateFlashcardRequest {
  /// Returns a new [CreateFlashcardRequest] instance.
  CreateFlashcardRequest({
    required this.content,
    required this.answer,
  });

  String content;

  String answer;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateFlashcardRequest &&
     other.content == content &&
     other.answer == answer;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (content.hashCode) +
    (answer.hashCode);

  @override
  String toString() => 'CreateFlashcardRequest[content=$content, answer=$answer]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'content'] = this.content;
      json[r'answer'] = this.answer;
    return json;
  }

  /// Returns a new [CreateFlashcardRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateFlashcardRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateFlashcardRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateFlashcardRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateFlashcardRequest(
        content: mapValueOfType<String>(json, r'content')!,
        answer: mapValueOfType<String>(json, r'answer')!,
      );
    }
    return null;
  }

  static List<CreateFlashcardRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateFlashcardRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateFlashcardRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateFlashcardRequest> mapFromJson(dynamic json) {
    final map = <String, CreateFlashcardRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateFlashcardRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateFlashcardRequest-objects as value to a dart map
  static Map<String, List<CreateFlashcardRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateFlashcardRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateFlashcardRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'content',
    'answer',
  };
}

