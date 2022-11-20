# learning_api.api.FlashcardEndpointApi

## Load the API package
```dart
import 'package:learning_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFlashcard**](FlashcardEndpointApi.md#createflashcard) | **POST** /flashcards | Create a flashcard
[**getById**](FlashcardEndpointApi.md#getbyid) | **GET** /flashcards/{id} | Get a flashcard by id


# **createFlashcard**
> Object createFlashcard(createFlashcardRequest)

Create a flashcard

### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FlashcardEndpointApi();
final createFlashcardRequest = CreateFlashcardRequest(); // CreateFlashcardRequest | 

try {
    final result = api_instance.createFlashcard(createFlashcardRequest);
    print(result);
} catch (e) {
    print('Exception when calling FlashcardEndpointApi->createFlashcard: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createFlashcardRequest** | [**CreateFlashcardRequest**](CreateFlashcardRequest.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getById**
> FlashcardDetailsResponse getById(id)

Get a flashcard by id

### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FlashcardEndpointApi();
final id = 789; // int | 

try {
    final result = api_instance.getById(id);
    print(result);
} catch (e) {
    print('Exception when calling FlashcardEndpointApi->getById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**FlashcardDetailsResponse**](FlashcardDetailsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

