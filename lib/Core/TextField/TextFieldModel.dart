import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../error/failures.dart';

class TextFieldModel {
  bool isValid = true;
  String errorText = 'error';
  TextEditingController textEditingController = TextEditingController();

  void valid(Either<Failure, bool> validationRepository) {
    final Either<Failure, bool> result = validationRepository;

    result.fold(
      (l) {
        isValid = false;
        errorText = (l as MessageFailure).message;
      },
      (r) {
        isValid = r;
        errorText = null;
      },
    );
  }
}
