//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuizDetailsResponse {
  /// Returns a new [QuizDetailsResponse] instance.
  QuizDetailsResponse({
    required this.quizId,
    this.questions = const [],
  });

  int quizId;

  List<QuizQuestion> questions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuizDetailsResponse &&
     other.quizId == quizId &&
     other.questions == questions;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (quizId.hashCode) +
    (questions.hashCode);

  @override
  String toString() => 'QuizDetailsResponse[quizId=$quizId, questions=$questions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'quizId'] = this.quizId;
      json[r'questions'] = this.questions;
    return json;
  }

  /// Returns a new [QuizDetailsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static QuizDetailsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "QuizDetailsResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "QuizDetailsResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return QuizDetailsResponse(
        quizId: mapValueOfType<int>(json, r'quizId')!,
        questions: QuizQuestion.listFromJson(json[r'questions'])!,
      );
    }
    return null;
  }

  static List<QuizDetailsResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <QuizDetailsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = QuizDetailsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, QuizDetailsResponse> mapFromJson(dynamic json) {
    final map = <String, QuizDetailsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuizDetailsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of QuizDetailsResponse-objects as value to a dart map
  static Map<String, List<QuizDetailsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<QuizDetailsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuizDetailsResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'quizId',
    'questions',
  };
}

