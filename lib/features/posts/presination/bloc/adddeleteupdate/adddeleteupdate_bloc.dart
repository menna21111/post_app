import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/features/posts/domain/entites/post.dart';

import '../../../../../core/erors/failure.dart';
import '../../../domain/usecases/addpostusecase.dart';
import '../../../domain/usecases/deletepostusecase.dart';
import '../../../domain/usecases/updatepostusecase.dart';

part 'adddeleteupdate_event.dart';
part 'adddeleteupdate_state.dart';

class AdddeleteupdateBloc
    extends Bloc<AdddeleteupdateEvent, AdddeleteupdateState> {
  final Addpostusecase addpostusecase;
  final Deletepostusecase deletepostusecase;
  final Updatepostusecase updatepostusecase;
  AdddeleteupdateBloc(
      {required this.addpostusecase,
      required this.deletepostusecase,
      required this.updatepostusecase})
      : super(AdddeleteupdateInitial()) {
    on<AdddeleteupdateEvent>((event, emit) async {
      if (event is Addpost) {
        emit(AdddeleteupdateLoading());
        final res=await addpostusecase(event.post);
        emit(eitherToState(res, 'Post added'));
      } else if (event is Deletepost) {
         final res=await deletepostusecase(event.postid);
        emit(eitherToState(res, 'Post deleted'));
      } else if (event is Updatepost) {
         final res=await updatepostusecase(event.post);
        emit(eitherToState(res, 'Post updated'));
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

  AdddeleteupdateState eitherToState(Either<Failure, Unit> either, String mes) {
    return either.fold((f) => AdddeleteupdateError(mes: _getmessageeror(f)),
        (_) => AdddeleteupdateLoaded(mes: mes));
  }
}
