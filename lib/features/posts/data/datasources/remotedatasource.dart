import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:posts_app/features/posts/data/models/postmodel.dart';

import '../../../../core/erors/excpetion.dart';

abstract class Remotedatasource {
  Future<List<Postmodel>> getAllposts();
  Future<Unit> deleteposts(int postid);
  Future<Unit> updateposts(Postmodel postmodel);
  Future<Unit> addposts(Postmodel postmodel);
}

const baseurl = 'https://jsonplaceholder.typicode.com/posts';

class Remotedatasourceimplwithdio implements Remotedatasource {
  final Dio dio;
  Remotedatasourceimplwithdio({required this.dio});
  @override
  Future<Unit> addposts(Postmodel postmodel) async {
    final response = await dio.post(baseurl,
  options: Options(headers: {'Content-Type': 'application/json'}),
        data: {'title': postmodel.title, 'body': postmodel.body});
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteposts(int postid) async {
    final res = await dio.delete(
      '$baseurl/$postid',
        options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (res.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Postmodel>> getAllposts() async {
    final response = await dio.get(
      baseurl,
    );
    if (response.statusCode == 200) {
      final List dataa = response.data;
      List<Postmodel> post = dataa.map((e) => Postmodel.fromJson(e)).toList();
      return post;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateposts(Postmodel postmodel) async {
    final res = await dio.patch(baseurl + '/${postmodel.id}',
        data: {'title': postmodel.title, 'body': postmodel.body},
        );
    if (res.statusCode == 200) {
      return Future.value(unit);
    }else{
      throw ServerException();}
  }
}
