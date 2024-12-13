import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/posts/data/datasources/localdata.dart';
import '../features/posts/data/datasources/remotedatasource.dart';
import '../features/posts/data/repo/posrrepoimplement.dart';
import '../features/posts/domain/repo/postsrepo.dart';
import '../features/posts/domain/usecases/addpostusecase.dart';
import '../features/posts/domain/usecases/deletepostusecase.dart';
import '../features/posts/domain/usecases/getallpostsusecase.dart';
import '../features/posts/domain/usecases/updatepostusecase.dart';
import '../features/posts/presination/bloc/adddeleteupdate/adddeleteupdate_bloc.dart';
import '../features/posts/presination/bloc/getposts/getposts_bloc.dart';

final sl = GetIt.instance;


Future<void> initdi() async {final sharedpref = await SharedPreferences.getInstance();
  //bloc take factory we can use it many times
  sl.registerFactory(() => AdddeleteupdateBloc(
      addpostusecase: sl(), deletepostusecase: sl(), updatepostusecase: sl()));
  sl.registerFactory<GetpostsBloc>(
      () => GetpostsBloc(getallpostsusecase: sl()));
  //repo lazy singletone as they use only one time and do when requested
  sl.registerLazySingleton<Postsrepo>(() => Posrrepoimplement(
      localdata: sl(), remotedatasource: sl(), network: sl()));
  //uusescases lazy singletone as they use only one time and do when requested
  sl.registerLazySingleton(
      () => Addpostusecase(postsrepo: sl()));
  sl.registerLazySingleton(
      () => Deletepostusecase(postsrepo: sl()));
  sl.registerLazySingleton(
      () => Getallpostsusecase(postsrepo: sl()));
  sl.registerLazySingleton(
      () => Updatepostusecase(postsrepo: sl()));
  //datasorce  also lazysingle tone
  sl.registerLazySingleton<Remotedatasource>(
      () => Remotedatasourceimplwithdio(dio: sl()));
  sl.registerLazySingleton<Localdata>(
      () => Postlocaldatasharedprefrences(sharedPreferences: sl()));
  //core
  sl.registerLazySingleton<Network>(
      () => NetworkImpl(internetConnectionChecker: sl()));
  //external
  sl.registerLazySingleton(() => sharedpref);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
