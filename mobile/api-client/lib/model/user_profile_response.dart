//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserProfileResponse {
  /// Returns a new [UserProfileResponse] instance.
  UserProfileResponse({
    required this.username,
    required this.email,
    required this.finishedActivitiesCount,
    required this.friendsCount,
    required this.dailyStreak,
  });

  String username;

  String email;

  int finishedActivitiesCount;

  int friendsCount;

  int dailyStreak;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserProfileResponse &&
     other.username == username &&
     other.email == email &&
     other.finishedActivitiesCount == finishedActivitiesCount &&
     other.friendsCount == friendsCount &&
     other.dailyStreak == dailyStreak;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (username.hashCode) +
    (email.hashCode) +
    (finishedActivitiesCount.hashCode) +
    (friendsCount.hashCode) +
    (dailyStreak.hashCode);

  @override
  String toString() => 'UserProfileResponse[username=$username, email=$email, finishedActivitiesCount=$finishedActivitiesCount, friendsCount=$friendsCount, dailyStreak=$dailyStreak]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'username'] = this.username;
      json[r'email'] = this.email;
      json[r'finishedActivitiesCount'] = this.finishedActivitiesCount;
      json[r'friendsCount'] = this.friendsCount;
      json[r'dailyStreak'] = this.dailyStreak;
    return json;
  }

  /// Returns a new [UserProfileResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserProfileResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserProfileResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserProfileResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserProfileResponse(
        username: mapValueOfType<String>(json, r'username')!,
        email: mapValueOfType<String>(json, r'email')!,
        finishedActivitiesCount: mapValueOfType<int>(json, r'finishedActivitiesCount')!,
        friendsCount: mapValueOfType<int>(json, r'friendsCount')!,
        dailyStreak: mapValueOfType<int>(json, r'dailyStreak')!,
      );
    }
    return null;
  }

  static List<UserProfileResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserProfileResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserProfileResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserProfileResponse> mapFromJson(dynamic json) {
    final map = <String, UserProfileResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProfileResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserProfileResponse-objects as value to a dart map
  static Map<String, List<UserProfileResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserProfileResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProfileResponse.listFromJson(entry.value, growable: growable,);
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
    'email',
    'finishedActivitiesCount',
    'friendsCount',
    'dailyStreak',
  };
}

