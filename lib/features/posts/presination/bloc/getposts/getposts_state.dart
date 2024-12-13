part of 'getposts_bloc.dart';

sealed class GetpostsState extends Equatable {
  const GetpostsState();

  @override
  List<Object> get props => [];
}

final class GetpostsInitial extends GetpostsState {}

class GetpostsLoading extends GetpostsState {}

class GetpostsLoaded extends GetpostsState {
final  List<Post> post;
  const GetpostsLoaded({required this.post});

  @override
  List<Object> get props => [post];
}

class GetpostsError extends GetpostsState {
 final   String mes;
  const GetpostsError({required this.mes});

  @override
  List<Object> get props => [mes];
}
