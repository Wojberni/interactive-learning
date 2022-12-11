//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchResult {
  /// Returns a new [SearchResult] instance.
  SearchResult({
    required this.id,
    required this.title,
    required this.description,
    required this.kind,
  });

  int id;

  String title;

  String description;

  SearchResultKindEnum kind;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchResult &&
     other.id == id &&
     other.title == title &&
     other.description == description &&
     other.kind == kind;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (title.hashCode) +
    (description.hashCode) +
    (kind.hashCode);

  @override
  String toString() => 'SearchResult[id=$id, title=$title, description=$description, kind=$kind]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'title'] = this.title;
      json[r'description'] = this.description;
      json[r'kind'] = this.kind;
    return json;
  }

  /// Returns a new [SearchResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SearchResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SearchResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SearchResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SearchResult(
        id: mapValueOfType<int>(json, r'id')!,
        title: mapValueOfType<String>(json, r'title')!,
        description: mapValueOfType<String>(json, r'description')!,
        kind: SearchResultKindEnum.fromJson(json[r'kind'])!,
      );
    }
    return null;
  }

  static List<SearchResult>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SearchResult> mapFromJson(dynamic json) {
    final map = <String, SearchResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SearchResult-objects as value to a dart map
  static Map<String, List<SearchResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SearchResult>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchResult.listFromJson(entry.value, growable: growable,);
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
    'title',
    'description',
    'kind',
  };
}


class SearchResultKindEnum {
  /// Instantiate a new enum with the provided [value].
  const SearchResultKindEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const QUIZ = SearchResultKindEnum._(r'QUIZ');
  static const FLASHCARD = SearchResultKindEnum._(r'FLASHCARD');

  /// List of all possible values in this [enum][SearchResultKindEnum].
  static const values = <SearchResultKindEnum>[
    QUIZ,
    FLASHCARD,
  ];

  static SearchResultKindEnum? fromJson(dynamic value) => SearchResultKindEnumTypeTransformer().decode(value);

  static List<SearchResultKindEnum>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchResultKindEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchResultKindEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SearchResultKindEnum] to String,
/// and [decode] dynamic data back to [SearchResultKindEnum].
class SearchResultKindEnumTypeTransformer {
  factory SearchResultKindEnumTypeTransformer() => _instance ??= const SearchResultKindEnumTypeTransformer._();

  const SearchResultKindEnumTypeTransformer._();

  String encode(SearchResultKindEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a SearchResultKindEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SearchResultKindEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'QUIZ': return SearchResultKindEnum.QUIZ;
        case r'FLASHCARD': return SearchResultKindEnum.FLASHCARD;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [SearchResultKindEnumTypeTransformer] instance.
  static SearchResultKindEnumTypeTransformer? _instance;
}


