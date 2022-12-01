//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuizListResponse {
  /// Returns a new [QuizListResponse] instance.
  QuizListResponse({
    this.quizzes = const [],
  });

  List<Quiz> quizzes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuizListResponse &&
     other.quizzes == quizzes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (quizzes.hashCode);

  @override
  String toString() => 'QuizListResponse[quizzes=$quizzes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'quizzes'] = this.quizzes;
    return json;
  }

  /// Returns a new [QuizListResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static QuizListResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "QuizListResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "QuizListResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return QuizListResponse(
        quizzes: Quiz.listFromJson(json[r'quizzes']) ?? const [],
      );
    }
    return null;
  }

  static List<QuizListResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <QuizListResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = QuizListResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, QuizListResponse> mapFromJson(dynamic json) {
    final map = <String, QuizListResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuizListResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of QuizListResponse-objects as value to a dart map
  static Map<String, List<QuizListResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<QuizListResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuizListResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

