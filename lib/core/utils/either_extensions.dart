import 'package:dartz/dartz.dart';
import 'package:pokedex_global66/core/error/failure.dart';

extension EitherExtensions<L extends Failure, R> on Either<L, R> {
  void handle({
    required void Function(R data) onSuccess,
    required void Function(L failure) onFailure,
  }) {
    fold(onFailure, onSuccess);
  }
}

extension FutureEitherExtensions<L extends Failure, R> on Future<Either<L, R>> {
  Future<void> handle({
    required void Function(R data) onSuccess,
    required void Function(L failure) onFailure,
  }) async {
    final result = await this;
    result.fold(onFailure, onSuccess);
  }
}
