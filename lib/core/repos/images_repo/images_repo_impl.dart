import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruithupdashboard/core/error/failers.dart';
import 'package:fruithupdashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failures, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
  
}