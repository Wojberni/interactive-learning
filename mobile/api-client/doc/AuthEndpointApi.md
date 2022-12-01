# learning_api.api.AuthEndpointApi

## Load the API package
```dart
import 'package:learning_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**login**](AuthEndpointApi.md#login) | **POST** /auth/login | 
[**register**](AuthEndpointApi.md#register) | **POST** /auth/register | 


# **login**
> LoginUserResponse login(loginUserRequest)



### Example
```dart
import 'package:learning_api/api.dart';

final api_instance = AuthEndpointApi();
final loginUserRequest = LoginUserRequest(); // LoginUserRequest | 

try {
    final result = api_instance.login(loginUserRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthEndpointApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginUserRequest** | [**LoginUserRequest**](LoginUserRequest.md)|  | 

### Return type

[**LoginUserResponse**](LoginUserResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **register**
> DefaultResponse register(registerUserRequest)



### Example
```dart
import 'package:learning_api/api.dart';

final api_instance = AuthEndpointApi();
final registerUserRequest = RegisterUserRequest(); // RegisterUserRequest | 

try {
    final result = api_instance.register(registerUserRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthEndpointApi->register: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerUserRequest** | [**RegisterUserRequest**](RegisterUserRequest.md)|  | 

### Return type

[**DefaultResponse**](DefaultResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

