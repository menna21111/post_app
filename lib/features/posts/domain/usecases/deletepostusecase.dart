import 'package:dartz/dartz.dart';

import '../../../../core/erors/failure.dart';
import '../repo/postsrepo.dart';

class Deletepostusecase {
  final Postsrepo postsrepo;

  Deletepostusecase({required this.postsrepo});
    Future <Either <Failure,Unit>>call(int postid)async{
      return await postsrepo.deletePosts(postid);
    }
  }