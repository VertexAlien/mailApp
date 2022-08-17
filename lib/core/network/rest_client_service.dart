import 'package:chopper/chopper.dart';
import 'package:riseup_mail/core/utils/constants.dart';

part "rest_client_service.chopper.dart";

@ChopperApi(baseUrl: API_BASE_URL)
abstract class RestClientService extends ChopperService {
  static RestClientService create([ChopperClient? client]) => _$RestClientService(client);

  //Get requests

  @Get(path: '/domains')
  Future<Response> getDomains();

  @Get(path: '/messages', headers: {'accept': 'application/json'})
  Future<Response> getMails(@Header('Authorization') String token, @Query() String page);

  //Post requests

  @Post(path: '/token', headers: {'Content-Type': 'application/json', 'accept': 'application/json'})
  Future<Response> signIn(@Body() String body);

  @Post(path: '/accounts', headers: {'Content-Type': 'application/json', 'accept': 'application/json'})
  Future<Response> signUp(@Body() String body);
}
