//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class NotificationsEndpointApi {
  NotificationsEndpointApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Registers or updates a firebase token associated with a device
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RegisterOrUpdateDeviceTokenRequest] registerOrUpdateDeviceTokenRequest (required):
  Future<Response> registerOrUpdateDeviceTokenWithHttpInfo(RegisterOrUpdateDeviceTokenRequest registerOrUpdateDeviceTokenRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/notifications/device-token';

    // ignore: prefer_final_locals
    Object? postBody = registerOrUpdateDeviceTokenRequest;

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

  /// Registers or updates a firebase token associated with a device
  ///
  /// Parameters:
  ///
  /// * [RegisterOrUpdateDeviceTokenRequest] registerOrUpdateDeviceTokenRequest (required):
  Future<void> registerOrUpdateDeviceToken(RegisterOrUpdateDeviceTokenRequest registerOrUpdateDeviceTokenRequest,) async {
    final response = await registerOrUpdateDeviceTokenWithHttpInfo(registerOrUpdateDeviceTokenRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
