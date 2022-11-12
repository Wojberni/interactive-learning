import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/custom_navigation_bar.dart';
import 'package:mobile/profile/widgets/custom_counter.dart';
import 'package:mobile/profile/widgets/custom_counter_description.dart';

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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Image.asset('assets/images/user.png',
                              width: 70, height: 70),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01),
                          child: const Text(
                            'Profil użytkownika',
                            style: TextStyle(
                                fontSize: 34,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.015),
                          child: Container(
                              width: screenWidth * 0.8,
                              height: screenHeight * 0.15,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenWidth * 0.04,
                                        bottom: screenHeight * 0.01),
                                    child: Text(
                                      profilePageData.username!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 34,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: screenHeight * 0.01),
                                    child: Text(
                                      profilePageData.email!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01),
                          child: Container(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: screenWidth * 0.04,
                                      bottom: screenHeight * 0.03),
                                  child: const Text(
                                    'Statystyki',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 34,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                const CustomCounterDescription(text: 'Liczba wykonanych ćwiczeń'),
                                CustomCounter(
                                    text: profilePageData.finishedActivitiesCount!.toString()
                                ),
                                const CustomCounterDescription(text: 'Aktualny daily streak'),
                                CustomCounter(
                                    text: profilePageData.dailyStreak.toString()
                                ),
                                const CustomCounterDescription(text: 'Liczba znajomych'),
                                CustomCounter(
                                    text: profilePageData.friendsCount.toString()
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.1,
                                vertical: screenHeight * 0.02),
                            child: SizedBox(
                              width: screenWidth * 0.8,
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
                                child: const Center(
                                  child: Text(
                                    'Znajomi',
                                    style: TextStyle(
                                        fontSize: 34,
                                        color: Colors.deepPurpleAccent,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const CustomNavigationBar(),
              ],
            );
          } else {
            return const Text('Pobieranie danych');
          }
        },
      ),
    )));
  }
}

class ProfilePageData {
  String? username = "";
  String? email = "";
  int? finishedActivitiesCount = 0;
  int? friendsCount = 0;
  int dailyStreak = 0;
}
