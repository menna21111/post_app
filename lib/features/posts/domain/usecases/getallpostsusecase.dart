import 'package:dartz/dartz.dart';

import '../../../../core/erors/failure.dart';
import '../entites/post.dart';
import '../repo/postsrepo.dart';

class Getallpostsusecase {
  final Postsrepo postsrepo;

  Getallpostsusecase({required this.postsrepo});
  Future<Either<Failure, List<Post>>> call() async {//call method when you do class and has only method call and you  want to access method you can only use class ithoud wantto acess the the method  and giveit prameters
    return await postsrepo.getPosts();
  }
}
