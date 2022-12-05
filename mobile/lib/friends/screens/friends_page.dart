import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/login_register/extensions/custom_validation_extension.dart';
import 'package:mobile/profile/widgets/navigation_button.dart';
import 'package:mobile/quiz/add/widgets/custom_form_field.dart';

import '../../common/helpers/snackbar.dart';
import '../data/friends_list_data.dart';
import '../data/get_friends_and_requests_list.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<StatefulWidget> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late Future<FriendsListData> dataFuture;
  final _formKey = GlobalKey<FormState>();

  String _login = "";

  @override
  void initState() {
    super.initState();

    dataFuture = getFriendsData();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: FutureBuilder<FriendsListData?>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            FriendsListData friendsListData = snapshot.data!;
            friendsListData.friends = friendsListData.friends.toList();
            return Column(
              children: [
                Flexible(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                    children: [
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/friends.png',
                                width: 70, height: 70),
                          const Expanded(
                            child: Text(
                              'Znajomi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          IconButton(onPressed: () => context.go('/requests'), iconSize: 70,
                            icon: const Icon(Icons.email_outlined, color: Colors.deepPurpleAccent),)
                        ],
                      ),
                      CustomFormField(
                        hintText: 'Wpisz login znajomego...',
                        validator: (login) => validateLoginInput(login),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.15,
                            vertical: screenHeight * 0.02),
                        child: NavigationButton('Dodaj znajomego', () {
                          handleAddFriend();
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.03),
                        child: const Text(
                          'Lista znajomych',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 36,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                        child: SizedBox(
                            height: screenHeight * 0.4,
                            child: friendsListData.friends.isNotEmpty
                                ? ListView.builder(
                                    itemCount:
                                        friendsListData.friends.toList().length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                          child: ListTile(
                                        title: Text(friendsListData.friends
                                            .toList()
                                            .elementAt(index)
                                            .username),
                                        tileColor: Colors.grey[200],
                                        onTap: () {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: const Text(
                                                  'Czy na pewno chcesz usunąć znajomego?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: const Text('Anuluj'),
                                                ),
                                                TextButton(
                                                  onPressed: () => {
                                                    handleDeleteFriend(
                                                        friendsListData.friends
                                                            .elementAt(index)
                                                            .id),
                                                    setState(() {
                                                      friendsListData.friends
                                                          .removeAt(index);
                                                    }),
                                                    Navigator.pop(context)
                                                  },
                                                  child: const Text('Usuń'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ));
                                    })
                                : const Center(
                                    child: Text(
                                    "Brak dodanych znajomych",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ))),
                      ),
                    ],
                  ),
                ),
                const CustomNavigationBar(),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    )));
  }

  String? validateLoginInput(String? value) {
    if (value!.isEmpty) {
      return "Wpisz login!";
    } else if (!value.isValidName) {
      return "Wpisz poprawny login!";
    } else {
      _login = value;
      return null;
    }
  }

  void handleAddFriend() {
    if (_formKey.currentState!.validate()) {
      FriendsEndpointApi(apiClient)
          .addFriend(AddFriendRequest(username: _login))
          .then((value) => {
                showSnackBar(context, 'Wysłano zaproszenie do znajomych!',
                    SnackBarType.info)
              })
          .catchError((err) => {
                if (err.code == 400)
                  {
                    showSnackBar(
                        context,
                        'Nie znaleziono użytkownika lub wysłano już zaproszenie!',
                        SnackBarType.error)
                  }
              });
    }
  }

  void handleDeleteFriend(int id) {
    FriendsEndpointApi(apiClient).removeMyFriend(id).then((value) => {
          showSnackBar(context, 'Usunięto użytkownika z listy znajomych!',
              SnackBarType.info)
        });
  }
}