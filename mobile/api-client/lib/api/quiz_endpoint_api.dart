//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class QuizEndpointApi {
  QuizEndpointApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new quiz
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateQuizRequest] createQuizRequest (required):
  Future<Response> createQuizWithHttpInfo(CreateQuizRequest createQuizRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/quizzes';

    // ignore: prefer_final_locals
    Object? postBody = createQuizRequest;

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

  /// Create a new quiz
  ///
  /// Parameters:
  ///
  /// * [CreateQuizRequest] createQuizRequest (required):
  Future<Object?> createQuiz(CreateQuizRequest createQuizRequest,) async {
    final response = await createQuizWithHttpInfo(createQuizRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Get all quizzes
  ///
  /// Returns a list of all quizzes for presentation purposes (the quizzes do not include questions)
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getAllQuizzesWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/quizzes';

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

  /// Get all quizzes
  ///
  /// Returns a list of all quizzes for presentation purposes (the quizzes do not include questions)
  Future<QuizListResponse?> getAllQuizzes() async {
    final response = await getAllQuizzesWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuizListResponse',) as QuizListResponse;
    
    }
    return null;
  }

  /// Get the daily challenge
  ///
  /// Returns the daily challenge quiz with all questions and answers
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getDailyChallengeWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/quizzes/daily-challenge';

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

  /// Get the daily challenge
  ///
  /// Returns the daily challenge quiz with all questions and answers
  Future<QuizDetailsResponse?> getDailyChallenge() async {
    final response = await getDailyChallengeWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuizDetailsResponse',) as QuizDetailsResponse;
    
    }
    return null;
  }

  /// Get a quiz by id
  ///
  /// Returns a quiz with all questions and answers
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> getQuizByIdWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/quizzes/{id}'
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

  /// Get a quiz by id
  ///
  /// Returns a quiz with all questions and answers
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<QuizDetailsResponse?> getQuizById(int id,) async {
    final response = await getQuizByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuizDetailsResponse',) as QuizDetailsResponse;
    
    }
    return null;
  }

  /// Report quiz score
  ///
  /// Reports the score for a quiz so that it is persisted
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ReportQuizScoreRequest] reportQuizScoreRequest (required):
  Future<Response> reportQuizScoreWithHttpInfo(ReportQuizScoreRequest reportQuizScoreRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/quizzes/report-score';

    // ignore: prefer_final_locals
    Object? postBody = reportQuizScoreRequest;

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

  /// Report quiz score
  ///
  /// Reports the score for a quiz so that it is persisted
  ///
  /// Parameters:
  ///
  /// * [ReportQuizScoreRequest] reportQuizScoreRequest (required):
  Future<Object?> reportQuizScore(ReportQuizScoreRequest reportQuizScoreRequest,) async {
    final response = await reportQuizScoreWithHttpInfo(reportQuizScoreRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }
}
