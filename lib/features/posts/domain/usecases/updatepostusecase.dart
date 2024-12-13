import 'package:dartz/dartz.dart';

import '../../../../core/erors/failure.dart';
import '../entites/post.dart';
import '../repo/postsrepo.dart';

class Updatepostusecase {
  final Postsrepo postsrepo; 

  Updatepostusecase({required this.postsrepo});
   
  Future <Either <Failure,Unit>>call(Post post)async{
    return await postsrepo.updatePosts(post);
  } 
}