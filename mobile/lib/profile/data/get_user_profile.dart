import 'package:learning_api/api.dart';
import 'package:mobile/profile/data/profile_page_data.dart';

import '../../api/ApiClient.dart';

Future<ProfilePageData> getUserProfileData() async {
  ProfilePageData profilePageData = ProfilePageData();
  await UserEndpointApi(apiClient).getCurrentUserProfile().then((value) => {
    profilePageData.username = value?.username,
    profilePageData.email = value?.email,
    profilePageData.friendsCount = value?.friendsCount,
    profilePageData.finishedActivitiesCount =
        value?.finishedActivitiesCount,
    // add daily streak data
    // profilePageData.dailyStreak = value?.dailyStreak
  });

  return profilePageData;
}