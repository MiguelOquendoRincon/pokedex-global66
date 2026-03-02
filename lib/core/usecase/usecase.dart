// ══════════════════════════════════════════════════════════════════════════════
// core/usecase/usecase.dart  — Base contracts (ISP: thin interfaces)
// ══════════════════════════════════════════════════════════════════════════════
import 'package:fpdart/fpdart.dart';
import 'package:pokedex_global66/core/error/app_exception.dart';

/// Synchronous use-case contract.
abstract interface class UseCase<Type, Params> {
  TaskEither<AppException, Type> call(Params params);
}

/// Use-case that requires no parameters.
abstract interface class NoParamsUseCase<Type> {
  TaskEither<AppException, Type> call();
}

/// Marker for use-cases that return [Unit] (side-effect only).
typedef UnitUseCase<Params> = UseCase<Unit, Params>;
