import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'Core/Validator/ValidationRepository.dart';
import 'Core/Validator/ValidationRepositoryImpl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Feature

  ///validation
  validation;

  ///Core
  core;

  ///External
  external;
}

void get validation {
  sl.registerLazySingleton<ValidationRepository>(
    () => ValidationRepositoryImpl(),
  );
}

void get core {
  //sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

void get external {
  sl.registerLazySingleton(() => http.Client());
  //sl.registerLazySingleton(() => DataConnectionChecker());
}
