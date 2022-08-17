import 'dart:convert';

import 'package:riseup_mail/core/error/exceptions.dart';
import 'package:riseup_mail/core/network/rest_client_service.dart';
import 'package:riseup_mail/features/mails/data/models/mail_model.dart';
import 'package:riseup_mail/features/mails/domain/entities/mail.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MailsRemoteDataSource {
  Future<List<Mail>> getMails({required String page});
}

class MailsRemoteDataSourceImpl implements MailsRemoteDataSource {
  final RestClientService restClientService;

  MailsRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<List<Mail>> getMails({required String page}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    if (token == null) throw AuthorizationException();

    final response = await restClientService.getMails('Bearer $token', page);

    if (response.statusCode == 401) throw AuthorizationException();
    if (response.statusCode != 200) throw ServerException();

    return List.from(json.decode(response.body).map((x) => MailModel.fromJson(x)));
  }
}
