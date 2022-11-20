# learning_api.api.QuizEndpointApi

## Load the API package
```dart
import 'package:learning_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createQuiz**](QuizEndpointApi.md#createquiz) | **POST** /quizzes | Create a new quiz
[**getAllQuizzes**](QuizEndpointApi.md#getallquizzes) | **GET** /quizzes | Get all quizzes
[**getQuizById**](QuizEndpointApi.md#getquizbyid) | **GET** /quizzes/{id} | Get a quiz by id


# **createQuiz**
> Object createQuiz(createQuizRequest)

Create a new quiz

### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = QuizEndpointApi();
final createQuizRequest = CreateQuizRequest(); // CreateQuizRequest | 

try {
    final result = api_instance.createQuiz(createQuizRequest);
    print(result);
} catch (e) {
    print('Exception when calling QuizEndpointApi->createQuiz: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createQuizRequest** | [**CreateQuizRequest**](CreateQuizRequest.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllQuizzes**
> QuizListResponse getAllQuizzes()

Get all quizzes

Returns a list of all quizzes for presentation purposes (the quizzes do not include questions)

### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = QuizEndpointApi();

try {
    final result = api_instance.getAllQuizzes();
    print(result);
} catch (e) {
    print('Exception when calling QuizEndpointApi->getAllQuizzes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**QuizListResponse**](QuizListResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQuizById**
> QuizDetailsResponse getQuizById(id)

Get a quiz by id

Returns a quiz with all questions and answers

### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = QuizEndpointApi();
final id = 789; // int | 

try {
    final result = api_instance.getQuizById(id);
    print(result);
} catch (e) {
    print('Exception when calling QuizEndpointApi->getQuizById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**QuizDetailsResponse**](QuizDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

