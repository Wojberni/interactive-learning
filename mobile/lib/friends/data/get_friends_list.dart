import 'package:learning_api/api.dart';

import '../../api/ApiClient.dart';
import 'friends_list_data.dart';

Future<FriendsListData> getFriendsData() async {
  FriendsListData friendsListData = FriendsListData();
  await FriendsEndpointApi(apiClient).getMyFriends().then(
      (value) => {if (value != null) friendsListData.friends = value.friends});

  return friendsListData;
}