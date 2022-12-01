//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuizAnswer {
  /// Returns a new [QuizAnswer] instance.
  QuizAnswer({
    required this.content,
    required this.isCorrect,
  });

  String content;

  bool isCorrect;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuizAnswer &&
     other.content == content &&
     other.isCorrect == isCorrect;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (content.hashCode) +
    (isCorrect.hashCode);

  @override
  String toString() => 'QuizAnswer[content=$content, isCorrect=$isCorrect]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'content'] = this.content;
      json[r'isCorrect'] = this.isCorrect;
    return json;
  }

  /// Returns a new [QuizAnswer] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static QuizAnswer? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "QuizAnswer[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "QuizAnswer[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return QuizAnswer(
        content: mapValueOfType<String>(json, r'content')!,
        isCorrect: mapValueOfType<bool>(json, r'isCorrect')!,
      );
    }
    return null;
  }

  static List<QuizAnswer>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <QuizAnswer>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = QuizAnswer.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, QuizAnswer> mapFromJson(dynamic json) {
    final map = <String, QuizAnswer>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuizAnswer.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of QuizAnswer-objects as value to a dart map
  static Map<String, List<QuizAnswer>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<QuizAnswer>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuizAnswer.listFromJson(entry.value, growable: growable,);
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
    'isCorrect',
  };
}

