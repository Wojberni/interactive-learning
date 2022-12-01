//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FriendsListResponse {
  /// Returns a new [FriendsListResponse] instance.
  FriendsListResponse({
    this.friends = const [],
  });

  List<Friend> friends;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FriendsListResponse &&
     other.friends == friends;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (friends.hashCode);

  @override
  String toString() => 'FriendsListResponse[friends=$friends]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'friends'] = this.friends;
    return json;
  }

  /// Returns a new [FriendsListResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FriendsListResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FriendsListResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FriendsListResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FriendsListResponse(
        friends: Friend.listFromJson(json[r'friends'])!,
      );
    }
    return null;
  }

  static List<FriendsListResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FriendsListResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FriendsListResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FriendsListResponse> mapFromJson(dynamic json) {
    final map = <String, FriendsListResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FriendsListResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FriendsListResponse-objects as value to a dart map
  static Map<String, List<FriendsListResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FriendsListResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FriendsListResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'friends',
  };
}

