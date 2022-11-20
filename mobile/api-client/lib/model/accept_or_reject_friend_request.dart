//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AcceptOrRejectFriendRequest {
  /// Returns a new [AcceptOrRejectFriendRequest] instance.
  AcceptOrRejectFriendRequest({
    this.friendRequestId,
    this.action,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? friendRequestId;

  AcceptOrRejectFriendRequestActionEnum? action;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AcceptOrRejectFriendRequest &&
     other.friendRequestId == friendRequestId &&
     other.action == action;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (friendRequestId == null ? 0 : friendRequestId!.hashCode) +
    (action == null ? 0 : action!.hashCode);

  @override
  String toString() => 'AcceptOrRejectFriendRequest[friendRequestId=$friendRequestId, action=$action]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.friendRequestId != null) {
      json[r'friendRequestId'] = this.friendRequestId;
    } else {
      json[r'friendRequestId'] = null;
    }
    if (this.action != null) {
      json[r'action'] = this.action;
    } else {
      json[r'action'] = null;
    }
    return json;
  }

  /// Returns a new [AcceptOrRejectFriendRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AcceptOrRejectFriendRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AcceptOrRejectFriendRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AcceptOrRejectFriendRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AcceptOrRejectFriendRequest(
        friendRequestId: mapValueOfType<int>(json, r'friendRequestId'),
        action: AcceptOrRejectFriendRequestActionEnum.fromJson(json[r'action']),
      );
    }
    return null;
  }

  static List<AcceptOrRejectFriendRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AcceptOrRejectFriendRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AcceptOrRejectFriendRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AcceptOrRejectFriendRequest> mapFromJson(dynamic json) {
    final map = <String, AcceptOrRejectFriendRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AcceptOrRejectFriendRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AcceptOrRejectFriendRequest-objects as value to a dart map
  static Map<String, List<AcceptOrRejectFriendRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AcceptOrRejectFriendRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AcceptOrRejectFriendRequest.listFromJson(entry.value, growable: growable,);
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


class AcceptOrRejectFriendRequestActionEnum {
  /// Instantiate a new enum with the provided [value].
  const AcceptOrRejectFriendRequestActionEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACCEPT = AcceptOrRejectFriendRequestActionEnum._(r'ACCEPT');
  static const REJECT = AcceptOrRejectFriendRequestActionEnum._(r'REJECT');

  /// List of all possible values in this [enum][AcceptOrRejectFriendRequestActionEnum].
  static const values = <AcceptOrRejectFriendRequestActionEnum>[
    ACCEPT,
    REJECT,
  ];

  static AcceptOrRejectFriendRequestActionEnum? fromJson(dynamic value) => AcceptOrRejectFriendRequestActionEnumTypeTransformer().decode(value);

  static List<AcceptOrRejectFriendRequestActionEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AcceptOrRejectFriendRequestActionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AcceptOrRejectFriendRequestActionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AcceptOrRejectFriendRequestActionEnum] to String,
/// and [decode] dynamic data back to [AcceptOrRejectFriendRequestActionEnum].
class AcceptOrRejectFriendRequestActionEnumTypeTransformer {
  factory AcceptOrRejectFriendRequestActionEnumTypeTransformer() => _instance ??= const AcceptOrRejectFriendRequestActionEnumTypeTransformer._();

  const AcceptOrRejectFriendRequestActionEnumTypeTransformer._();

  String encode(AcceptOrRejectFriendRequestActionEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AcceptOrRejectFriendRequestActionEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AcceptOrRejectFriendRequestActionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACCEPT': return AcceptOrRejectFriendRequestActionEnum.ACCEPT;
        case r'REJECT': return AcceptOrRejectFriendRequestActionEnum.REJECT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AcceptOrRejectFriendRequestActionEnumTypeTransformer] instance.
  static AcceptOrRejectFriendRequestActionEnumTypeTransformer? _instance;
}


