//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_endpoint_api.dart';
part 'api/flashcard_endpoint_api.dart';
part 'api/friends_endpoint_api.dart';
part 'api/notifications_endpoint_api.dart';
part 'api/quiz_endpoint_api.dart';
part 'api/user_endpoint_api.dart';

part 'model/accept_or_reject_friend_request.dart';
part 'model/add_friend_request.dart';
part 'model/create_flashcard_request.dart';
part 'model/create_quiz_request.dart';
part 'model/flashcard_details_response.dart';
part 'model/friend.dart';
part 'model/friend_request.dart';
part 'model/friends_list_response.dart';
part 'model/login_user_request.dart';
part 'model/login_user_response.dart';
part 'model/pending_friend_requests_response.dart';
part 'model/quiz.dart';
part 'model/quiz_answer.dart';
part 'model/quiz_details_response.dart';
part 'model/quiz_list_response.dart';
part 'model/quiz_question.dart';
part 'model/register_or_update_device_token_request.dart';
part 'model/register_user_request.dart';
part 'model/report_quiz_score_request.dart';
part 'model/user_profile_response.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
