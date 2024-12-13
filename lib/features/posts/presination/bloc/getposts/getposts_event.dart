part of 'getposts_bloc.dart';

sealed class GetpostsEvent extends Equatable {
  const GetpostsEvent();

  @override
  List<Object> get props => [];
}
class Getposts extends GetpostsEvent {}
class GetpostsRefresh extends GetpostsEvent {}