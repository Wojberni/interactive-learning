import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/profile/widgets/custom_counter_with_description.dart';
import 'package:mobile/profile/widgets/profile_page_icon_with_description.dart';

import '../data/profile_page_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<ProfilePageData> dataFuture;

  @override
  void initState() {
    super.initState();

    dataFuture = getUserProfileData();
  }

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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: FutureBuilder<ProfilePageData?>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProfilePageData profilePageData = snapshot.data!;
            return Column(
              children: [
                Flexible(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.02,
                            bottom: screenHeight * 0.01),
                        child: Image.asset('assets/images/user.png',
                            width: 70, height: 70),
                      ),
                      const Text(
                        'Profil użytkownika',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: Container(
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: ProfilePageIconWithDescription(
                                email: profilePageData.email!,
                                username: profilePageData.username!)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: Container(
                          height: screenHeight * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02),
                                child: const Text(
                                  'Statystyki',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              CustomCounterWithDescription(
                                text: profilePageData.finishedActivitiesCount!
                                    .toString(),
                                description: 'Liczba wykonanych ćwiczeń',
                              ),
                              CustomCounterWithDescription(
                                text: profilePageData.dailyStreak.toString(),
                                description: 'Aktualny daily streak',
                              ),
                              CustomCounterWithDescription(
                                text: profilePageData.friendsCount.toString(),
                                description: 'Liczba znajomych',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.02),
                          child: SizedBox(
                            height: screenHeight * 0.1,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey[200]!),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: const BorderSide(
                                              color: Colors.grey)))),
                              child: const Text(
                                'Znajomi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 34,
                                    color: Colors.deepPurpleAccent,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const CustomNavigationBar(),
              ],
            );
          } else {
            return const Text('Pobieranie danych', textAlign: TextAlign.center);
          }
        },
      ),
    )));
  }
}