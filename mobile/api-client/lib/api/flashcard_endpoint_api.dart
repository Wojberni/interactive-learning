//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FlashcardEndpointApi {
  FlashcardEndpointApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a flashcard
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateFlashcardRequest] createFlashcardRequest (required):
  Future<Response> createFlashcardWithHttpInfo(CreateFlashcardRequest createFlashcardRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/flashcards';

    // ignore: prefer_final_locals
    Object? postBody = createFlashcardRequest;

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

  /// Create a flashcard
  ///
  /// Parameters:
  ///
  /// * [CreateFlashcardRequest] createFlashcardRequest (required):
  Future<DefaultResponse?> createFlashcard(CreateFlashcardRequest createFlashcardRequest,) async {
    final response = await createFlashcardWithHttpInfo(createFlashcardRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DefaultResponse',) as DefaultResponse;
    
    }
    return null;
  }

  /// Get a flashcard by id
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> getByIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/flashcards/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Get a flashcard by id
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<FlashcardDetailsResponse?> getById(int id,) async {
    final response = await getByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FlashcardDetailsResponse',) as FlashcardDetailsResponse;
    
    }
    return null;
  }
}
