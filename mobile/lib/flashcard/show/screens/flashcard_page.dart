import 'dart:convert';

import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/flashcard/show/models/flashcard_dto.dart';
import 'package:mobile/flashcard/show/widgets/flashcard_container.dart';

import '../widgets/header_flashcard.dart';
import 'package:flutter/material.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage(this.id, {super.key});
  final int id;

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  String question = "Question";
  String answer = "Answer";

  Future<FlashcardDTO?> _getFlashcard(BuildContext context) async {
    FlashcardDetailsResponse? response =
        await FlashcardEndpointApi(apiClient).getById(widget.id);
    if (response != null) {
      Map<String, dynamic> json = jsonDecode(jsonEncode(response));
      return FlashcardDTO.fromJSON(json);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _getFlashcard(context);
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<FlashcardDTO?>(
          future: _getFlashcard(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              FlashcardDTO? flashcard = snapshot.data;
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const HeaderFlashcard(),
                      Expanded(
                        flex: 6,
                        child: FlashcardContainer(flashcard!.content, flashcard.answer),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              // TODO: add better looking error message later
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }
}
