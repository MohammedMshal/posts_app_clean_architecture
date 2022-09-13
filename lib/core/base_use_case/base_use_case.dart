import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:postes_app_clean_architecture/core/error/failures.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failures, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}