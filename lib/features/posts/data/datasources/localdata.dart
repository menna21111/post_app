import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app/features/posts/data/models/postmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/erors/excpetion.dart';

abstract class Localdata {
  Future<List<Postmodel>> getcachedallpost();
  Future<Unit> cacheallpost(List<Postmodel> postmodel); //Unit
}

class Postlocaldatasharedprefrences implements Localdata {
  final SharedPreferences sharedPreferences;

  Postlocaldatasharedprefrences({required this.sharedPreferences});
  @override
  Future<Unit> cacheallpost(List<Postmodel> postmodel) {
    List postmodeltojson =
        postmodel.map<Map<String, dynamic>>((e) => e.toJson()).toList();
    sharedPreferences.setString('cachedposts', json.encode(postmodeltojson));
    return Future.value(unit);
  }//here it convert list to list of map and enode it 
//enocde convert model to map 
//decode convert map to model
  @override
  Future<List<Postmodel>> getcachedallpost() {
    final jsondata = sharedPreferences.getString('cachedposts');
    if (jsondata != null) {
      List decodedjson = json.decode(jsondata);
      List<Postmodel> postmodell =
          decodedjson.map((e) => Postmodel.fromJson(e)).toList();
      return Future.value(postmodell);
    } else {
      throw CacheException();
    }
  }//here it convert list of map to list and decode it
}
