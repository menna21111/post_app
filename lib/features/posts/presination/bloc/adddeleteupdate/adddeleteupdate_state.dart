part of 'adddeleteupdate_bloc.dart';

sealed class AdddeleteupdateState extends Equatable {
  const AdddeleteupdateState();

  @override
  List<Object> get props => [];
}

final class AdddeleteupdateInitial extends AdddeleteupdateState {}

class AdddeleteupdateLoaded extends AdddeleteupdateState {
    final String mes;

  const AdddeleteupdateLoaded({required this.mes});  
   @override
  List<Object> get props => [mes];
}

class AdddeleteupdateLoading extends AdddeleteupdateState {}

class AdddeleteupdateError extends AdddeleteupdateState {
  final String mes;

  const AdddeleteupdateError({required this.mes});  
   @override
  List<Object> get props => [mes];
}