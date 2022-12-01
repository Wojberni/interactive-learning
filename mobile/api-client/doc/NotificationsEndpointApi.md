# learning_api.api.NotificationsEndpointApi

## Load the API package
```dart
import 'package:learning_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**registerOrUpdateDeviceToken**](NotificationsEndpointApi.md#registerorupdatedevicetoken) | **POST** /notifications/device-token | Registers or updates a firebase token associated with a device


# **registerOrUpdateDeviceToken**
> registerOrUpdateDeviceToken(registerOrUpdateDeviceTokenRequest)

Registers or updates a firebase token associated with a device

### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationsEndpointApi();
final registerOrUpdateDeviceTokenRequest = RegisterOrUpdateDeviceTokenRequest(); // RegisterOrUpdateDeviceTokenRequest | 

try {
    api_instance.registerOrUpdateDeviceToken(registerOrUpdateDeviceTokenRequest);
} catch (e) {
    print('Exception when calling NotificationsEndpointApi->registerOrUpdateDeviceToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerOrUpdateDeviceTokenRequest** | [**RegisterOrUpdateDeviceTokenRequest**](RegisterOrUpdateDeviceTokenRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

