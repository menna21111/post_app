

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Network {
  Future<bool> get isConnected;
}

class NetworkImpl implements Network {
  final InternetConnectionChecker  internetConnectionChecker;

  NetworkImpl({required this.internetConnectionChecker});
  @override

  Future<bool> get isConnected =>internetConnectionChecker.hasConnection;
}
