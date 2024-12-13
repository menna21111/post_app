import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/erors/failure.dart';

import '../../../domain/entites/post.dart';
import '../../../domain/usecases/getallpostsusecase.dart';

part 'getposts_event.dart';
part 'getposts_state.dart';

class GetpostsBloc extends Bloc<GetpostsEvent, GetpostsState> {
  final Getallpostsusecase getallpostsusecase;
  GetpostsBloc({required this.getallpostsusecase}) : super(GetpostsInitial()) {
    on<GetpostsEvent>((event, emit) async {
      if (event is Getposts) {
        emit(GetpostsLoading());
        final response = await getallpostsusecase();
        emit(_mapFailureToState(response));
      }else if(event is GetpostsRefresh){
       emit(GetpostsLoading());
       final response = await getallpostsusecase();
        emit(_mapFailureToState(response));
      }
    });
  }
  String _getmessageeror(Failure fail) {
    switch (fail.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case OfflineFailure:
        return 'Offline Failure';
      case WrongFailure:
        return 'Wrong Failure';
      case CachingFailure:
        return 'Caching';
      default:
        return 'Uknown Failure';
    }
  }

  GetpostsState _mapFailureToState(  Either<Failure, List<Post>> either) {
    return either.fold((failure) => GetpostsError(mes: _getmessageeror(failure)), (r) => GetpostsLoaded(post: r));
  }
}
