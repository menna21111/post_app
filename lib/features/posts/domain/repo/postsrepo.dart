import 'package:dartz/dartz.dart';
import 'package:posts_app/features/posts/domain/entites/post.dart';

import '../../../../core/erors/failure.dart';

abstract class Postsrepo {
  Future <Either <Failure,List <Post>>>getPosts();
  Future <Either <Failure,Unit>>addPosts(Post post);//unit as void butwe can use it as a return in func
  Future <Either <Failure,Unit>>deletePosts( int postid);
  Future <Either <Failure,Unit>>updatePosts(Post post);
}