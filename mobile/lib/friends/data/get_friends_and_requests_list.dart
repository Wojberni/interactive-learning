import 'package:learning_api/api.dart';
import 'package:mobile/friends/data/requests_list_data.dart';

import '../../api/ApiClient.dart';
import 'friends_list_data.dart';

Future<FriendsListData> getFriendsData() async {
  FriendsListData friendsListData = FriendsListData();
  await FriendsEndpointApi(apiClient).getMyFriends().then(
      (value) => {if (value != null) friendsListData.friends = value.friends});

  return friendsListData;
}

Future<RequestsListData> getRequestsData() async {
  RequestsListData requestsListData = RequestsListData();
  await FriendsEndpointApi(apiClient).getPendingFriendRequests().then(
          (value) => {if (value != null) requestsListData.friendRequests = value.friendRequests});

  return requestsListData;
}