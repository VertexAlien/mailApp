import 'dart:convert';

import 'package:riseup_mail/core/error/exceptions.dart';
import 'package:riseup_mail/core/network/rest_client_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignInRemoteDataSource {
  Future<void> signIn({required String email, required String password});
}

class SignInRemoteDataSourceImpl extends SignInRemoteDataSource {
  final RestClientService restClientService;

  SignInRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<void> signIn({required String email, required String password}) async {
    final String body = json.encode({"address": email, "password": password});

    final response = await restClientService.signIn(body);

    if (response.statusCode == 404) throw AuthorizationException();

    if (response.statusCode != 200) throw ServerException();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', json.decode(response.bodyString)["token"]);

    return;
  }
}
