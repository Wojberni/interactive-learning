import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/profile/widgets/custom_counter_with_description.dart';
import 'package:mobile/profile/widgets/navigation_button.dart';
import 'package:mobile/profile/widgets/profile_page_icon_with_description.dart';

import '../data/get_user_profile.dart';
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
                      SizedBox(
                        height: screenHeight * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NavigationButton(
                                'Znajomi', () => context.go('/friends')),
                            NavigationButton('Wyloguj',
                                () => {logout(), context.go('/auth/login')}),
                          ],
                        ),
                      ),
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

  Future<void> logout() async {
    var storage = const FlutterSecureStorage();
    await storage.delete(key: 'token');
    apiClient.defaultHeaderMap.remove('Authorization');
  }
}