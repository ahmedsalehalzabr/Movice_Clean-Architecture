import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_movice/core/error/failure.dart';

abstract class BaseUsesCase<T, parameters> {
  Future<Either<Failure, T>> call(parameters parameters);
}
class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}