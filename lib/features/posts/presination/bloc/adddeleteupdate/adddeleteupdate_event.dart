part of 'adddeleteupdate_bloc.dart';

sealed class AdddeleteupdateEvent extends Equatable {
  const AdddeleteupdateEvent();

  @override
  List<Object> get props => [];
}

class Addpost extends AdddeleteupdateEvent {
  final Post post;
  const Addpost({required this.post});
    @override
  List<Object> get props => [post];
}

class Deletepost extends AdddeleteupdateEvent {
  final int postid;
  const Deletepost({required this.postid});
    @override
  List<Object> get props => [postid];
}

class Updatepost extends AdddeleteupdateEvent {
  final Post post;
  const Updatepost({required this.post});
    @override
  List<Object> get props => [post];
}
