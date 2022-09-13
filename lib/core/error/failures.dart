import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{}

class OflineFailure extends Failures{}
class ServerFailure extends Failures{}
class DataBaseFailure extends Failures{}