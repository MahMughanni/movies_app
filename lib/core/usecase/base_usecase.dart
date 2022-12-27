import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
