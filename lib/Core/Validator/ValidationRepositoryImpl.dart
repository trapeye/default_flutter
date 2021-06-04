import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import 'ValidationRepository.dart';
import 'string_validators.dart';
import 'textUtilsStringExtension.dart';

class ValidationRepositoryImpl extends ValidationRepository {
  @override
  Either<Failure, bool> validationEmail(String value) {
    if (NonEmptyStringValidator().isValid(value)) {
      if (value.isValidEmail) {
        return Right(true);
      } else {
        return Left(MessageFailure('Email not valid'));
      }
    } else {
      return Left(MessageFailure('Email is empty'));
    }
  }

  @override
  Either<Failure, bool> validationName(String value) {
    if (NonEmptyStringValidator().isValid(value)) {
      return Right(true);
    } else {
      return Left(MessageFailure('Name is Empty'));
    }
  }

  @override
  Either<Failure, bool> validationPassword(String value) {
    bool notEmpty = NonEmptyStringValidator().isValid(value);
    bool oneUpper = RegexOneUpperCase().isValid(value);
    bool oneLower = RegexOneLowerCase().isValid(value);
    bool oneDigit = RegexOneDigit().isValid(value);
    bool oneSpecialChar = RegexOneSpecialCharacter().isValid(value);

    if (notEmpty) {
      if (!oneUpper) {
        return Left(MessageFailure('Need at least one upper case'));
      } else if (!oneLower) {
        return Left(MessageFailure('Need at least one lower case'));
      } else if (!oneDigit) {
        return Left(MessageFailure('Need at least one digit'));
      } else if (!oneSpecialChar) {
        return Left(MessageFailure('Need at least one special character'));
      } else {
        return Right(true);
      }
    } else {
      return Left(MessageFailure('Password is empty'));
    }
  }

  @override
  Either<Failure, bool> validationPhone(String value) {
    if (NonEmptyStringValidator().isValid(value)) {
      if (value.length > 8) {
        return Right(true);
      } else {
        return Left(MessageFailure('Mobile phone not complete'));
      }
    } else {
      return Left(MessageFailure('Mobile phone is empty'));
    }
  }

  @override
  Either<Failure, bool> validationSameValue(SameValueModel params) {
    if (params.isSame) {
      return Right(true);
    } else {
      return Left(MessageFailure(params.errorText));
    }
  }
}
