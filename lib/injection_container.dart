import 'dart:io';

import 'package:chopper/chopper.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riseup_mail/core/network/network_info.dart';
import 'package:riseup_mail/core/network/rest_client_service.dart';
import 'package:riseup_mail/features/mails/data/datasources/mails_remote_datasource.dart';
import 'package:riseup_mail/features/mails/data/repositories/mails_repo_impl.dart';
import 'package:riseup_mail/features/mails/domain/repositories/mails_repo.dart';
import 'package:riseup_mail/features/mails/domain/usecases/get_all_mails_usecase.dart';
import 'package:riseup_mail/features/sign_in/data/datasources/sign_in_remote_datasource.dart';
import 'package:riseup_mail/features/sign_in/data/repositories/sign_in_repo_impl.dart';
import 'package:riseup_mail/features/sign_in/domain/repositories/sign_in_repo.dart';
import 'package:riseup_mail/features/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:riseup_mail/features/sign_up/data/datasources/sign_up_remote_datasource.dart';
import 'package:riseup_mail/features/sign_up/data/repositories/sign_up_repository_impl.dart';
import 'package:riseup_mail/features/sign_up/domain/repositories/sign_up_repository.dart';
import 'package:riseup_mail/features/sign_up/domain/usecases/get_domains_usecase.dart';
import 'package:riseup_mail/features/sign_up/domain/usecases/sign_up_usecase.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

Future<void> init() async {
  //Use Cases
  // sl.registerLazySingleton(() => SignInUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetDomainsUsecase(signUpRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(signUpRepository: sl()));
  sl.registerLazySingleton(() => SignInUseCase(signInRepository: sl()));
  sl.registerLazySingleton(() => GetAllMailsUseCase(mailsRepo: sl()));

  //Repositories
  // sl.registerLazySingleton<SignInRepository>(() => SignInRepository(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<MailsRepository>(() => MailsRepositoryImpl(mailsRemoteDataSource: sl(), networkInfo: sl()));

  //Data Sources
  // sl.registerLazySingleton<SignInRemoteDataSource>(() => SignInRemoteDataSource(auth: sl()));
  sl.registerLazySingleton<SignUpRemoteDataSource>(() => SignUpRemoteDataSourceImpl(restClientService: sl()));
  sl.registerLazySingleton<SignInRemoteDataSource>(() => SignInRemoteDataSourceImpl(restClientService: sl()));
  sl.registerLazySingleton<MailsRemoteDataSource>(() => MailsRemoteDataSourceImpl(restClientService: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dataConnectionChecker: sl()));

  //Intialize

  final client = ChopperClient(
    interceptors: [
      CurlInterceptor(),
      HttpLoggingInterceptor(),
    ],
  );

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // sl.registerLazySingleton(() => FirebaseFirestore.instance);
  // sl.registerLazySingleton(() => FirebaseStorage.instance);
  sl.registerLazySingleton(() => RestClientService.create(client));
}
