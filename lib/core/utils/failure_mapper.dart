import 'package:pokedex_global66/core/error/failure.dart';

class FailureMapper {
  static String map(Failure failure) {
    if (failure is NetworkFailure) {
      return "Sin conexión a Internet. Verifica tu red.";
    } else if (failure is ServerFailure) {
      return "Error en el servidor. Intenta más tarde.";
    } else if (failure is AuthFailure) {
      return "Credenciales incorrectas. Intenta de nuevo.";
    } else if (failure is CacheFailure) {
      return "Error cargando datos locales.";
    } else if (failure is BadRequestFailure) {
      return "Solicitud inválida. Verifica los datos ingresados.";
    }

    return "Ocurrió un error inesperado.";
  }
}
