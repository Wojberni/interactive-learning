//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddFriendRequest {
  /// Returns a new [AddFriendRequest] instance.
  AddFriendRequest({
    required this.username,
  });

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddFriendRequest &&
     other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (username.hashCode);

  @override
  String toString() => 'AddFriendRequest[username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [AddFriendRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddFriendRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AddFriendRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AddFriendRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AddFriendRequest(
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<AddFriendRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddFriendRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddFriendRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddFriendRequest> mapFromJson(dynamic json) {
    final map = <String, AddFriendRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddFriendRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddFriendRequest-objects as value to a dart map
  static Map<String, List<AddFriendRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddFriendRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddFriendRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'username',
  };
}
