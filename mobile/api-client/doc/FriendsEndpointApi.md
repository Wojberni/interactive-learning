# learning_api.api.FriendsEndpointApi

## Load the API package
```dart
import 'package:learning_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addFriend**](FriendsEndpointApi.md#addfriend) | **POST** /friends/add | 
[**getPendingFriendRequests**](FriendsEndpointApi.md#getpendingfriendrequests) | **GET** /friends/requests/pending | 


# **addFriend**
> addFriend(addFriendRequest)



### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsEndpointApi();
final addFriendRequest = AddFriendRequest(); // AddFriendRequest | 

try {
    api_instance.addFriend(addFriendRequest);
} catch (e) {
    print('Exception when calling FriendsEndpointApi->addFriend: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addFriendRequest** | [**AddFriendRequest**](AddFriendRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPendingFriendRequests**
> PendingFriendRequestsResponse getPendingFriendRequests()



### Example
```dart
import 'package:learning_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsEndpointApi();

try {
    final result = api_instance.getPendingFriendRequests();
    print(result);
} catch (e) {
    print('Exception when calling FriendsEndpointApi->getPendingFriendRequests: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PendingFriendRequestsResponse**](PendingFriendRequestsResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

