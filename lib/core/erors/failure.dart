import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
 
  List<Object?> get props => [];
}
class CachingFailure extends Failure {
  @override
  
  List<Object?> get props => [];
}
class OfflineFailure extends Failure {
  @override
 
  List<Object?> get props => [];
}  
class WrongFailure extends Failure {
  @override
 
  List<Object?> get props => [];
}
