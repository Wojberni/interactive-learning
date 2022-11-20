//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Quiz {
  /// Returns a new [Quiz] instance.
  Quiz({
    required this.id,
    required this.name,
    required this.description,
    required this.createdByUsername,
  });

  int id;

  String name;

  String description;

  String createdByUsername;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Quiz &&
     other.id == id &&
     other.name == name &&
     other.description == description &&
     other.createdByUsername == createdByUsername;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (description.hashCode) +
    (createdByUsername.hashCode);

  @override
  String toString() => 'Quiz[id=$id, name=$name, description=$description, createdByUsername=$createdByUsername]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'description'] = this.description;
      json[r'createdByUsername'] = this.createdByUsername;
    return json;
  }

  /// Returns a new [Quiz] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Quiz? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Quiz[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Quiz[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Quiz(
        id: mapValueOfType<int>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description')!,
        createdByUsername: mapValueOfType<String>(json, r'createdByUsername')!,
      );
    }
    return null;
  }

  static List<Quiz>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Quiz>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Quiz.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Quiz> mapFromJson(dynamic json) {
    final map = <String, Quiz>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Quiz.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Quiz-objects as value to a dart map
  static Map<String, List<Quiz>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Quiz>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Quiz.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'description',
    'createdByUsername',
  };
}

