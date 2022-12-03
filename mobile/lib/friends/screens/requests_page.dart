import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/friends/data/requests_list_data.dart';
import 'package:mobile/profile/widgets/navigation_button.dart';

import '../data/get_friends_and_requests_list.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<StatefulWidget> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  late Future<RequestsListData> dataFuture;

  @override
  void initState() {
    super.initState();

    dataFuture = getRequestsData();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    RequestsListData requestsListData;

    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<RequestsListData?>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            requestsListData = snapshot.data!;
            requestsListData.friendRequests =
                requestsListData.friendRequests.toList();
            return Column(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.05),
                        child: const Text(
                          'Oczekujące zaproszenia',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                            horizontal: screenWidth * 0.05),
                        child: SizedBox(
                            height: screenHeight * 0.6,
                            child: requestsListData.friendRequests.isNotEmpty
                                ? ListView.builder(
                                    itemCount: requestsListData.friendRequests
                                        .toList()
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                          child: ListTile(
                                        title: Text(requestsListData
                                            .friendRequests
                                            .toList()
                                            .elementAt(index)
                                            .senderUsername),
                                        tileColor: Colors.grey[200],
                                        onTap: () {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: const Text(
                                                  'Czy chcesz zaakceptować zaproszenie?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () => {
                                                    handleRejectRequest(
                                                        requestsListData
                                                            .friendRequests
                                                            .elementAt(index)
                                                            .id),
                                                    setState(() {
                                                      requestsListData
                                                          .friendRequests
                                                          .removeAt(index);
                                                    }),
                                                    Navigator.pop(context)
                                                  },
                                                  child: const Text('Usuń'),
                                                ),
                                                TextButton(
                                                  onPressed: () => {
                                                    handleAcceptRequest(
                                                        requestsListData
                                                            .friendRequests
                                                            .elementAt(index)
                                                            .id),
                                                    setState(() {
                                                      requestsListData
                                                          .friendRequests
                                                          .removeAt(index);
                                                    }),
                                                    Navigator.pop(context)
                                                  },
                                                  child:
                                                      const Text('Zaakceptuj'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ));
                                    })
                                : const Center(
                                    child: Text(
                                    "Brak oczekujących zaproszeń",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavigationButton('Znajomi', () => context.go('/friends')),
                      NavigationButton(
                          'Odśwież',
                          () => getRequestsData().then((value) async => {
                                requestsListData.friendRequests =
                                    value.friendRequests,
                                setState(() {})
                              })),
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
    ));
  }

  void handleAcceptRequest(int id) {
    FriendsEndpointApi(apiClient).acceptOrRejectFriendRequest(
        AcceptOrRejectFriendRequest(
            friendRequestId: id,
            action: AcceptOrRejectFriendRequestActionEnum.ACCEPT));
  }

  void handleRejectRequest(int id) {
    FriendsEndpointApi(apiClient).acceptOrRejectFriendRequest(
        AcceptOrRejectFriendRequest(
            friendRequestId: id,
            action: AcceptOrRejectFriendRequestActionEnum.REJECT));
  }
}
