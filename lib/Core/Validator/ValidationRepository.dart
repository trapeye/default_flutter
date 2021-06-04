import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../error/failures.dart';

abstract class ValidationRepository {
  Either<Failure, bool> validationPhone(String value);
  Either<Failure, bool> validationPassword(String value);
  Either<Failure, bool> validationName(String value);
  Either<Failure, bool> validationEmail(String value);
  Either<Failure, bool> validationSameValue(SameValueModel params);
}

class SameValueModel {
  String value = '';
  String compare = '';
  String errorText = '';

  bool get isSame {
    return value == compare;
  }

  SameValueModel(
      {@required this.value, @required this.compare, @required this.errorText});
}
