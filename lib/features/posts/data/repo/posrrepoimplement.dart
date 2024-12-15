import 'package:dartz/dartz.dart';

import 'package:posts_app/core/erors/failure.dart';

import 'package:posts_app/features/posts/domain/entites/post.dart';

import '../../../../core/erors/excpetion.dart';
import '../../../../core/network.dart';
import '../../domain/repo/postsrepo.dart';
import '../datasources/localdata.dart';
import '../datasources/remotedatasource.dart';
import '../models/postmodel.dart';
typedef Future<Unit>  Addupdatedelete();
class Posrrepoimplement implements Postsrepo { 
  final Remotedatasource remotedatasource;
  final Localdata localdata;
  final Network network;

  Posrrepoimplement(
      {required this.network,required this.remotedatasource, required this.localdata});
  @override
  Future<Either<Failure, Unit>> addPosts(Post post) async {
    final Postmodel postmodel = Postmodel(
        id: post.id, title: post.title, body: post.body, userid: post.userid);
  return _getmessage(() {
      return remotedatasource.addposts(postmodel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(int postid) async {
    return _getmessage(() {
      return remotedatasource.deleteposts(postid);
    });
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    if (await network.isConnected) {
      try {
        final theposts = await remotedatasource.getAllposts();
        localdata.cacheallpost(theposts);
        return right(theposts);
      } on ServerException {sssss
        return left(ServerFailure());
      }
    } else {
      try {
        final theposts = await localdata.getcachedallpost();
        return right(theposts);
      } on CacheException {
        return left(CachingFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(Post post) async {
    final Postmodel postmodel = Postmodel(
        id: post.id, title: post.title, body: post.body, userid: post.userid);
    return _getmessage(() {
      return  remotedatasource.updateposts(postmodel);
    });
  }

  Future<Either<Failure, Unit>> _getmessage(//for not dublic ate code
   Addupdatedelete addupdatedelete) async {
    if (await network.isConnected) {
      try {
        await addupdatedelete();
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
