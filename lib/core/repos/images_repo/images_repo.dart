import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruithupdashboard/core/error/failers.dart';

abstract class ImagesRepo {
  Future<Either<Failures,String>> uploadImage(File image);
}
