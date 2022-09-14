

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseNetWorkInfo{
  Future<bool> get isConnected;
}
class NetWorkInfo implements BaseNetWorkInfo{
  final InternetConnectionChecker connectionChecker;

  NetWorkInfo(this.connectionChecker);
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => connectionChecker.hasConnection;

}