import 'dart:convert';

import 'package:riseup_mail/core/error/exceptions.dart';
import 'package:riseup_mail/core/network/rest_client_service.dart';
import 'package:riseup_mail/features/sign_up/data/models/domain_model.dart';
import 'package:riseup_mail/features/sign_up/domain/entities/domain.dart';

abstract class SignUpRemoteDataSource {
  Future<List<Domain>> getDomains();
  Future<void> signUp({required String email, required String password});
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final RestClientService restClientService;

  SignUpRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<List<Domain>> getDomains() async {
    final response = await restClientService.getDomains();

    if (response.statusCode != 200) throw ServerException();

    return List.from(json.decode(response.body)["hydra:member"].map((x) => DomainModel.fromJson(x)));
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    final String body = json.encode({"address": email, "password": password});

    final response = await restClientService.signUp(body);

    if (response.statusCode == 422) throw AuthorizationException();

    if (response.statusCode != 201) throw ServerException();

    return;
  }
}
