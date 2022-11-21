//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FriendsEndpointApi {
  FriendsEndpointApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /friends/requests/acceptOrReject' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [AcceptOrRejectFriendRequest] acceptOrRejectFriendRequest (required):
  Future<Response> acceptOrRejectFriendRequestWithHttpInfo(AcceptOrRejectFriendRequest acceptOrRejectFriendRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/friends/requests/acceptOrReject';

    // ignore: prefer_final_locals
    Object? postBody = acceptOrRejectFriendRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [AcceptOrRejectFriendRequest] acceptOrRejectFriendRequest (required):
  Future<void> acceptOrRejectFriendRequest(AcceptOrRejectFriendRequest acceptOrRejectFriendRequest,) async {
    final response = await acceptOrRejectFriendRequestWithHttpInfo(acceptOrRejectFriendRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /friends/add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [AddFriendRequest] addFriendRequest (required):
  Future<Response> addFriendWithHttpInfo(AddFriendRequest addFriendRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/friends/add';

    // ignore: prefer_final_locals
    Object? postBody = addFriendRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [AddFriendRequest] addFriendRequest (required):
  Future<void> addFriend(AddFriendRequest addFriendRequest,) async {
    final response = await addFriendWithHttpInfo(addFriendRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Returns a list of currently logged in user friends
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getMyFriendsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/friends';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Returns a list of currently logged in user friends
  Future<FriendsListResponse?> getMyFriends() async {
    final response = await getMyFriendsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FriendsListResponse',) as FriendsListResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /friends/requests/pending' operation and returns the [Response].
  Future<Response> getPendingFriendRequestsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/friends/requests/pending';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<PendingFriendRequestsResponse?> getPendingFriendRequests() async {
    final response = await getPendingFriendRequestsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PendingFriendRequestsResponse',) as PendingFriendRequestsResponse;
    
    }
    return null;
  }

  /// Ends a friendship with a user from currently logged in user's friends list
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] friendId (required):
  Future<Response> removeMyFriendWithHttpInfo(int friendId,) async {
    // ignore: prefer_const_declarations
    final path = r'/friends/{friendId}'
      .replaceAll('{friendId}', friendId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Ends a friendship with a user from currently logged in user's friends list
  ///
  /// Parameters:
  ///
  /// * [int] friendId (required):
  Future<void> removeMyFriend(int friendId,) async {
    final response = await removeMyFriendWithHttpInfo(friendId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
