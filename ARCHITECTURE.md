# Architecture Decision Record — Pokédex Favorites

> **Audiencia:** Evaluadores técnicos, colaboradores futuros y cualquier desarrollador que necesite entender *por qué* el sistema está construido como está, no solo *cómo*.

---

## Tabla de Contenidos

1. [Visión general](#1-visión-general)
2. [Arquitectura elegida: Clean Architecture + Feature-First](#2-arquitectura-elegida-clean-architecture--feature-first)
3. [Decisiones arquitectónicas (ADRs)](#3-decisiones-arquitectónicas-adrs)
4. [Patrones de diseño aplicados](#4-patrones-de-diseño-aplicados)
5. [Principios SOLID, DRY y KISS](#5-principios-solid-dry-y-kiss)
6. [Stack tecnológico — justificación](#6-stack-tecnológico--justificación)
7. [Capas de seguridad](#7-capas-de-seguridad)
8. [Uso de Inteligencia Artificial](#8-uso-de-inteligencia-artificial)

---

## 1. Visión general

La aplicación es un cliente móvil Flutter para la [PokéAPI](https://pokeapi.co) que permite explorar Pokémon, ver su detalle y gestionar una lista de favoritos persistida localmente.

Aunque el dominio es lúdico, la implementación aplica los mismos estándares de ingeniería que una aplicación de producción: separación estricta de capas, manejo funcional de errores, observabilidad completa y seguridad de datos en reposo y en tránsito.

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                   │
│         Riverpod Notifiers · Screens · Widgets          │
├─────────────────────────────────────────────────────────┤
│                     Domain Layer                        │
│         Entities · Use Cases · Repository Interfaces    │
├─────────────────────────────────────────────────────────┤
│                      Data Layer                         │
│     Models · Datasources · Repository Implementations   │
├──────────────────────┬──────────────────────────────────┤
│    Remote (Dio)      │      Local (SecureStorage)       │
│    PokéAPI REST      │      Flutter Secure Storage      │
└──────────────────────┴──────────────────────────────────┘
```

**Flujo de datos (Railway-Oriented):**

```
Widget
  └── watch/read Provider (Riverpod)
        └── calls UseCase
              └── returns TaskEither<AppException, T>
                    ├── Left(AppException)  →  error state  →  UI muestra error localizado
                    └── Right(T)            →  data state   →  UI renderiza datos
```

---

## 2. Arquitectura elegida: Clean Architecture + Feature-First

### Qué se eligió

**Clean Architecture** de Robert C. Martin (Uncle Bob), con organización de carpetas **Feature-First** en lugar de Layer-First.

```
lib/
├── core/                        # Transversal a todos los features
│   ├── network/                 # Dio, interceptores, constantes
│   ├── error/                   # AppException sealed class
│   ├── security/                # Pinning, SecureStorage
│   ├── observability/           # Talker, RiverpodObserver
│   ├── router/                  # GoRouter
│   ├── theme/                   # AppTheme light/dark, colores, tipografía
│   └── l10n/                    # ARB files, extensión de contexto
│
└── features/
    ├── onboarding/
    ├── pokemon_list/
    │   ├── data/                # Models, datasources, repo impl
    │   ├── domain/              # Entities, repo interfaces, use cases
    │   └── presentation/        # Providers, screens, widgets
    ├── pokemon_detail/
    ├── favorites/
    ├── regions/
    └── profile/
```

### Por qué Clean Architecture sobre otras opciones

| Alternativa considerada | Por qué se descartó |
|---|---|
| **MVC simple** | Mezcla lógica de negocio con UI; escala mal; difícil de testear sin mocks de widgets |
| **MVVM puro (sin capas)** | El ViewModel termina acoplado al framework HTTP; cambiar Dio requiere tocar presentación |
| **BLoC Architecture** | Boilerplate elevado para este scope; Riverpod ofrece el mismo control con menos código |
| **Clean Architecture layer-first** | `lib/data/`, `lib/domain/`, `lib/presentation/` — todos los features mezclados; difícil de escalar por equipo o módulo |

**Clean Architecture + Feature-First** gana porque:

- Cada feature es un módulo autocontenido: se puede trabajar en `pokemon_detail` sin tocar `favorites`.
- La regla de dependencia es estricta: `domain` no importa nada de `data` ni de `presentation`. El compilador de Dart lo refuerza.
- Los use cases son el contrato entre capas; cambiar la implementación del repositorio no requiere tocar ningún provider.
- Testeable por capa de forma aislada: se puede testear un use case con un mock del repositorio sin levantar Flutter.

---

## 3. Decisiones arquitectónicas (ADRs)

### ADR-001 — Manejo de errores con `fpdart` Either / TaskEither

**Contexto:** En Flutter, el patrón común es lanzar excepciones y capturarlas con `try/catch` en cada capa.

**Decisión:** Usar `TaskEither<AppException, T>` de `fpdart` en todas las capas de datos y dominio.

**Alternativas consideradas:**

| Opción | Pros | Contras |
|---|---|---|
| `try/catch` clásico | Familiar, menos código | Los errores son invisibles en la firma del método; fácil olvidar capturarlos |
| `Result<T, E>` manual | Control total | Reinventar la rueda; sin combinadores (`flatMap`, `map`, `fold`) |
| **`TaskEither<AppException, T>`** | Tipo explícito, composable, testeable, exhaustivo | Curva de aprendizaje para devs sin background funcional |

**Consecuencias:**
- Cada método que puede fallar lo declara en su firma: `TaskEither<AppException, PokemonDetail>`.
- Los errores no pueden ignorarse silenciosamente; el compilador obliga a manejar `Left` y `Right`.
- Encadenamiento limpio: `.map()`, `.flatMap()`, `.fold()` en lugar de múltiples `try/catch` anidados.

---

### ADR-002 — Estado y DI con Riverpod (anotaciones + `@riverpod`)

**Contexto:** Flutter tiene múltiples soluciones de estado: `setState`, `InheritedWidget`, `Provider`, `BLoC`, `Riverpod`, `GetX`, `MobX`.

**Decisión:** Riverpod con generación de código mediante `riverpod_annotation`.

**Alternativas consideradas:**

| Opción | Por qué se descartó |
|---|---|
| `Provider` (paquete original) | No type-safe; deprecado por su propio autor en favor de Riverpod |
| `BLoC` | Eventos y estados explícitos son valiosos en UIs complejas, pero el boilerplate es excesivo para este scope |
| `GetX` | Mezcla DI + estado + navegación; viola SRP; difícil de testear aisladamente |
| **Riverpod** | DI automática, sin `BuildContext` en lógica, `keepAlive`, `family`, `invalidate`; overrides en tests triviales |

**Por qué con anotaciones:**
- `@riverpod` genera el provider automáticamente; el desarrollador solo escribe la lógica.
- `riverpod_lint` detecta en tiempo de análisis patrones incorrectos (providers sin `ref`, dependencias circulares).
- Los providers son autodocumentados: la firma del método es el contrato.

---

### ADR-003 — Inmutabilidad con `Freezed`

**Decisión:** Todas las entidades de dominio, modelos de datos y estados de Riverpod son clases `@freezed`.

**Por qué:**
- Inmutabilidad garantizada por el compilador: no hay setters; solo `copyWith`.
- `==` y `hashCode` generados correctamente: Riverpod detecta cambios de estado sin boilerplate.
- Sealed unions (`AppException`) permiten pattern matching exhaustivo en Dart 3.
- `fromJson` / `toJson` generados por `json_serializable` en los modelos de datos.

---

### ADR-004 — Navegación con GoRouter

**Decisión:** GoRouter con `ShellRoute` para el `BottomNavigationBar` y redirección reactiva para el onboarding.

**Alternativas consideradas:**

| Opción | Por qué se descartó |
|---|---|
| `Navigator 1.0` | Imperativo; no soporta deep links; back-stack difícil de controlar |
| `Navigator 2.0` manual | Demasiado verboso para este scope |
| `AutoRoute` | Buena opción, pero GoRouter es el paquete oficial recomendado por el equipo Flutter |
| **GoRouter** | Declarativo, type-safe con `pathParameters`, `ShellRoute` integrado, redirect reactivo con Riverpod |

**Decisión crítica — `redirect` reactivo:**
```dart
redirect: (context, state) {
  if (!onboardingDone && !goingToOnboarding) return AppRoutes.onboarding;
  return null;
}
```
El router observa `onboardingDoneProvider`. Cuando el usuario completa el onboarding, el estado cambia y el router redirige automáticamente sin lógica en ningún widget.

---

### ADR-005 — Persistencia local con `flutter_secure_storage`

**Decisión:** Reemplazar `SharedPreferences` por `FlutterSecureStorage` para los datos de favoritos.

**Consecuencia positiva de la arquitectura:** Gracias al principio DIP y la interfaz `ILocalStorage`, el cambio se hace en una sola línea del `bootstrap.dart`. Ningún repositorio ni use case sabe que el almacenamiento cambió.

```dart
// Bootstrap — único lugar que conoce la implementación concreta
localStorageProvider.overrideWithValue(SecureLocalStorage());
```

---

## 4. Patrones de diseño aplicados

### Repository Pattern
**Dónde:** `IPokemonRepository`, `IFavoritesRepository`, `IPokemonDetailRepository`.

**Por qué:** Desacopla la fuente de datos (REST, local, caché) de la lógica de dominio. Si mañana PokéAPI agrega autenticación o se migra a GraphQL, solo cambia el datasource; los use cases no se tocan.

---

### Factory Method (Provider como fábrica)
**Dónde:** Cada `@riverpod` es esencialmente una fábrica gestionada por Riverpod.

```dart
@riverpod
GetPokemonListUseCase getPokemonListUseCase(Ref ref) =>
    GetPokemonListUseCase(ref.read(pokemonRepositoryProvider));
```

El contenedor de Riverpod gestiona el ciclo de vida; los consumidores solo declaran qué necesitan.

---

### Interceptor Pattern
**Dónde:** `ErrorInterceptor`, `CertificatePinningInterceptor`, `TalkerDioLogger`.

**Por qué:** Cada interceptor tiene una única responsabilidad. Se pueden agregar, quitar y reordenar sin modificar el cliente HTTP. Open/Closed Principle aplicado a la pipeline de red.

---

### Observer Pattern
**Dónde:** `TalkerRiverpodObserver` implementa `ProviderObserver`.

**Por qué:** Observabilidad sin acoplar Talker a ningún provider individual. Todos los cambios de estado pasan por un único punto de observación.

---

### Strategy Pattern
**Dónde:** `ILocalStorage` con dos estrategias: `SharedPrefsLocalStorage` (tests/debug) y `SecureLocalStorage` (producción).

**Por qué:** El algoritmo de persistencia puede intercambiarse en runtime (bootstrap) sin que los clientes lo sepan. El switch se hace en un único lugar.

---

### Railway-Oriented Programming (ROP)
**Dónde:** Toda la cadena datasource → repository → use case devuelve `TaskEither`.

**Por qué:** Los errores viajan por el "carril izquierdo" sin interrumpir el flujo. El código feliz (carril derecho) se escribe como si no hubiera errores; los transformadores (`.map`, `.flatMap`) solo se ejecutan en el carril correcto.

```
[Datasource] ──TaskEither──► [Repository mapper] ──TaskEither──► [UseCase] ──TaskEither──► [Provider fold]
                                                                                               ├── Left  → errorState
                                                                                               └── Right → dataState
```

---

## 5. Principios SOLID, DRY y KISS

### Single Responsibility Principle (SRP)

Cada clase tiene exactamente una razón para cambiar:

| Clase | Única responsabilidad |
|---|---|
| `FailureHandler` | Traducir `DioException` → `AppException` |
| `ErrorInterceptor` | Interceptar errores HTTP y normalizar antes de que lleguen al repo |
| `PokemonRepositoryImpl` | Mapear modelos de red a entidades de dominio |
| `ToggleFavoriteUseCase` | Lógica pura de toggle + persistencia encadenada |
| `TalkerRiverpodObserver` | Observar y registrar cambios de estado de Riverpod |

### Open/Closed Principle (OCP)

- `ILocalStorage` está cerrada para modificación pero abierta para extensión: `SecureLocalStorage`, `SharedPrefsLocalStorage`, y en el futuro `HiveLocalStorage` o `IsarLocalStorage` sin tocar el resto del sistema.
- Los interceptores de Dio son aditivos: agregar `RetryInterceptor` no modifica `ErrorInterceptor`.

### Liskov Substitution Principle (LSP)

`SecureLocalStorage` y `SharedPrefsLocalStorage` son intercambiables en cualquier contexto que espere `ILocalStorage`. El comportamiento observable (leer/escribir listas de strings) es idéntico; solo cambia el mecanismo de cifrado.

### Interface Segregation Principle (ISP)

Las interfaces son delgadas y específicas:
- `IPokemonRepository` solo expone `getPokemonList`.
- `IPokemonDetailRepository` solo expone `getPokemonDetail`.
- `IFavoritesRepository` expone `getFavorites` y `saveFavorites`.

Ningún repositorio tiene métodos que sus implementaciones deban dejar vacíos.

### Dependency Inversion Principle (DIP)

- Los use cases dependen de interfaces (`IPokemonRepository`), no de `PokemonRepositoryImpl`.
- `PokemonRepositoryImpl` depende de `IPokemonListRemoteDatasource`, no de `Dio` directamente.
- `bootstrap.dart` es el único lugar en toda la aplicación que conoce las implementaciones concretas.

---

### DRY (Don't Repeat Yourself)

| Abstracción | Qué evita repetir |
|---|---|
| `AppException` sealed class | Cada capa tiene su propio `enum` de errores con lógica duplicada |
| `FailureHandler.fromObject()` | `try/catch` con `DioException` copy-pasted en cada datasource |
| `AppTheme._build()` | Los 20+ componentes de `ThemeData` definidos dos veces (light y dark) |
| `ThemeExtensions` (`context.isDark`, `context.cardBg`) | `if (Theme.of(context).brightness == Brightness.dark)` repetido en cada widget |
| `context.l10n` extension | `AppLocalizations.of(context)` repetido en cada widget |
| `PokemonSummary.imageUrl` getter | La URL del artwork construida en cada widget que muestra una imagen |

---

### KISS (Keep It Simple, Stupid)

Decisiones de simplicidad consciente:

- **Sin servidor propio.** La prueba es un cliente; no se construyó un BFF ni una capa de caché en servidor.
- **Serialización de favoritos como `"id:name:type"`** en lugar de JSON completo. Los tres campos que se necesitan no justifican un modelo Freezed extra con `json_serializable`.
- **`PokemonTypeCache` como Map en memoria.** No se usa una base de datos ni caché con TTL para los tipos; un `Map<String, String>` en un provider `keepAlive` es suficiente y eliminable cuando la app se cierra.
- **Un único `ThemeData._build()`** con parámetros en lugar de dos builders completamente separados.

---

## 6. Stack tecnológico — justificación

| Paquete | Versión | Rol | Por qué este y no otro |
|---|---|---|---|
| `flutter_riverpod` | ^3.2.1 | Estado + DI | Type-safe, sin BuildContext en lógica, overrides en tests, observer integrado |
| `riverpod_annotation` | ^4.0.2 | Generación de providers | Elimina boilerplate; `riverpod_lint` detecta errores en análisis estático |
| `freezed` | ^3.2.5 | Inmutabilidad + sealed unions | `copyWith`, `==`, `hashCode`, pattern matching — todo generado |
| `fpdart` | ^1.2.0 | `Either` / `TaskEither` | Railway-Oriented Programming; errores explícitos en tipos |
| `dio` | ^5.9.2 | Cliente HTTP | Interceptores, cancelación, transformers; más composable que `http` |
| `go_router` | ^17.1.0 | Navegación | Paquete oficial Flutter; `ShellRoute`, deep links, redirect reactivo |
| `talker_flutter` | ^5.1.14 | Observabilidad | Logger estructurado + viewer in-app + adaptadores para Dio y Riverpod |
| `flutter_secure_storage` | ^10.0.0 | Persistencia cifrada | Keychain (iOS) + AES-GCM/RSA OAEP (Android Keystore) |
| `cached_network_image` | ^3.4.1 | Caché de imágenes | Evita descargas repetidas; shimmer integrado con placeholder |
| `shimmer` | ^3.0.0 | Skeleton loaders | UX de carga percibida sin implementación manual |
| `go_router` | ^17.1.0 | Navegación declarativa | ShellRoute para bottom nav, deep links, redirect reactivo |
| `lottie` | ^3.3.2 | Animaciones | Pokeball animada durante cargas sin assets de video |

---

## 7. Capas de seguridad

La API es pública, pero el vector de ataque en apps móviles no es la autenticación con el servidor, sino la integridad de la comunicación, la exposición de datos locales y la fuga de información interna.

### 7.1 Certificate Pinning

**Qué protege:** Ataques Man-in-the-Middle (MITM) donde un proxy (Charles, mitmproxy, Burp Suite) presenta su propio certificado TLS para interceptar y modificar el tráfico HTTPS.

**Cómo funciona:**

```
App  ──HTTPS──►  Servidor
        │
   [Interceptor valida]
   SHA-256(SPKI del cert) ∈ {hashes conocidos}?
        ├── Sí → conexión permitida
        └── No → DioException(badCertificate) → AppException.network
```

**Implementación:** `CertificatePinningInterceptor` + `applyPinningAdapter(dio)` en `DioClient`.

**Solo en release:** En debug/profile el pinning está desactivado. Esto permite que los desarrolladores usen proxies durante el desarrollo sin fricción.

**Estrategia de rotación de certificados:**
1. Añadir el hash del certificado nuevo al set `_pinnedHashes` (junto al actual).
2. Publicar la release con ambos hashes.
3. Esperar adopción suficiente (mínimo una semana).
4. Rotar el certificado en el servidor.
5. En la siguiente release, retirar el hash antiguo.

**Paquetes involucrados:** `dart:io` (`SecureSocket`, `X509Certificate`), `crypto` (SHA-256).

---

### 7.2 Cifrado de datos en reposo

**Qué protege:** Acceso no autorizado a los favoritos del usuario en dispositivos rooteados, backups de ADB sin cifrar, o acceso físico al almacenamiento interno.

**Sin cifrado:** Los favoritos se guardarían como texto plano en `SharedPreferences`:
```xml
<!-- /data/data/com.app/shared_prefs/FlutterSharedPreferences.xml -->
<string name="pokemon_favorites">["25:pikachu:electric","1:bulbasaur:grass"]</string>
```

**Con cifrado:** `FlutterSecureStorage` usa:

| Plataforma | Mecanismo | Resistencia |
|---|---|---|
| Android | Cifrado AES-GCM con clave RSA en Android Keystore | Hardware-backed en dispositivos con Secure Element (Android 6+) |
| iOS | Keychain con `kSecAttrAccessibleAfterFirstUnlock` | Inaccesible antes del primer desbloqueo tras reinicio |

**Transparencia arquitectural:** La interfaz `ILocalStorage` es idéntica. El único cambio está en `bootstrap.dart`:
```dart
// Antes:
localStorageProvider.overrideWithValue(SharedPrefsLocalStorage(prefs));
// Después:
localStorageProvider.overrideWithValue(SecureLocalStorage());
```

**Ningún repositorio, use case ni provider sabe que el almacenamiento cambió.** Este es el DIP y OCP aplicados a seguridad.

---

### 7.3 Supresión de logs en producción

**Qué protege:** Fuga de información interna (URLs, payloads, estado de providers) a través de `adb logcat` en builds de producción.

**Mecanismo:** `_ReleaseLogFilter` en Talker descarta todos los niveles `verbose`, `debug` e `info` cuando `kReleaseMode == true`. Solo `warning`, `error` y `critical` pasan.

```
Debug/Profile:  verbose ✓  debug ✓  info ✓  warning ✓  error ✓
Release:        verbose ✗  debug ✗  info ✗  warning ✓  error ✓
```

**Por qué mantener errores en release:** Permiten conectar un sistema de crash reporting (Sentry, Firebase Crashlytics) sin reabrir los logs completos.

---

### Resumen de superficie de ataque cubierta

| Vector | Mitigación | Estado |
|---|---|---|
| MITM / proxy de tráfico HTTPS | Certificate Pinning | ✅ Implementado |
| Lectura de datos en dispositivo rooteado | Cifrado con Secure Storage | ✅ Implementado |
| Fuga de internals por logs | Supresión de logs en release | ✅ Implementado |
| Certificados TLS inválidos | `badCertificateCallback: false` | ✅ Implementado |
| APK reempaquetado | `flutter build --obfuscate --split-debug-info` | ✅ Flag de build (no requiere código) |
| Captura de pantalla | `FLAG_SECURE` (Android) | ⬜ Nice to have (overkill para Pokédex) |
| Root/jailbreak detection | SafetyNet / DeviceCheck | ⬜ Válido en fintech; no justificado aquí |

---

## 8. Uso de Inteligencia Artificial

### 8.1 Filosofía de uso

La IA se usó como **copiloto estructurado**, no como generador libre. Cada interacción siguió un contrato estricto: el desarrollador define el *qué* y el *por qué*; la IA propone el *cómo*, y el desarrollador revisa, valida y decide.

> **Regla fundamental:** Todo código generado por IA es una propuesta. Ninguna línea entra al repositorio sin revisión humana explícita.

---

### 8.2 Contrato de gobernanza para uso de IA en desarrollo

#### Reglas de entrada (antes de cada prompt)

1. **Definir el contrato primero.** Antes de pedir código, se escribe la interfaz o firma del método. La IA rellena la implementación, nunca el contrato.
2. **Contexto explícito.** Cada prompt incluye: arquitectura del proyecto, paquetes en uso, principios a respetar (SOLID, DRY, etc.) y el archivo o capa específica donde va el código.
3. **Restricciones declaradas.** Se especifica qué no puede hacer la respuesta: no usar `BuildContext` fuera de widgets, no romper la regla de dependencia de Clean Architecture, no introducir paquetes no aprobados.
4. **Un problema por prompt.** Prompts focalizados producen respuestas más acotadas y verificables. Un prompt como "escribe toda la app" es inaceptable.

#### Reglas de revisión (sobre cada respuesta)

5. **Verificar la regla de dependencia.** ¿El código generado en `domain` importa algo de `data`? Rechazo inmediato.
6. **Verificar tipos de retorno.** ¿Los métodos que pueden fallar devuelven `TaskEither`? ¿Los que no pueden fallar devuelven el tipo directo?
7. **Verificar ausencia de magic strings.** Constantes hardcodeadas de API, keys de storage o rutas deben estar en sus respectivas clases de constantes.
8. **Verificar tests generados.** Los tests propuestos por la IA deben cubrir: caso feliz, caso de error y, cuando aplica, edge cases. Si la IA genera un test que solo prueba el camino feliz, se solicita completarlo.
9. **No aceptar "trust me" implícito.** Si la IA genera un algoritmo no trivial (ej: extracción del hash SPKI para certificate pinning), se verifica contra documentación oficial antes de aceptarlo.

#### Reglas de salida (antes del commit)

10. **Todo código generado se entiende.** Si no se puede explicar una línea generada por la IA en una revisión de código, no entra al PR.
11. **Commits etiquetados cuando es relevante.** Si un bloque sustancial fue generado con asistencia de IA y revisado, el commit puede anotarlo en la descripción del PR para transparencia con el equipo.
12. **La IA no toma decisiones arquitectónicas.** Los ADRs de este documento fueron tomados por el desarrollador. La IA puede listar opciones y pros/contras; la decisión final es siempre humana.

---

### 8.3 Áreas donde se usó IA en este proyecto

#### Detección de flujos críticos

Se usó IA para identificar los puntos donde un fallo silencioso tendría mayor impacto:

- **Flujo de favoritos:** ¿Qué pasa si `saveFavorites` falla pero el estado de Riverpod ya se actualizó? La IA identificó el riesgo de inconsistencia y propuso el patrón de encadenar la persistencia antes de actualizar el estado: `saveFavorites(updated).map((_) => updated)`.
- **Inicialización del router:** ¿Qué pasa si `onboardingDoneProvider` no está listo cuando el router evalúa el redirect? La IA identificó que el warm-up en `bootstrap.dart` es necesario para garantizar que el primer frame tenga el estado correcto.
- **Rotación de certificados:** La IA señaló que pinar un solo hash sin estrategia de rotación puede romper la app en producción cuando el certificado expire.

#### Documentación

- Generación del borrador inicial de docstrings para clases de infraestructura (`ErrorInterceptor`, `CertificatePinningInterceptor`, `SecureLocalStorage`).
- El desarrollador revisó cada docstring para verificar que la descripción sea precisa y no sobreprometida (ej: la IA inicialmente describió el pinning como "invulnerable a MITM"; se corrigió a "reduce significativamente la superficie de ataque").

#### Escritura de tests unitarios

El flujo seguido fue:

```
Desarrollador escribe la interfaz y el use case
        ↓
Desarrollador escribe los casos de test en comentarios:
  // caso 1: pokemon no está en favoritos → debe añadirse
  // caso 2: pokemon ya está → debe eliminarse
  // caso 3: falla el storage → debe retornar Left
        ↓
IA genera el código del test siguiendo los casos definidos
        ↓
Desarrollador verifica: ¿los mocks reflejan el contrato real?
¿Los assertions son significativos (no solo "no lanza excepción")?
        ↓
Ajustes y commit
```

**Lo que la IA no decide:** qué casos de test son importantes. Eso es criterio del desarrollador con conocimiento del dominio.

#### Revisión de patrones

Se consultó a la IA para validar si la aplicación del patrón Strategy en `ILocalStorage` era coherente con el principio OCP, y si el uso de `TaskEither` en los datasources (en lugar de solo en los repositorios) añadía valor real o era over-engineering. La IA argumentó en favor; el desarrollador validó el argumento y decidió mantenerlo.

---

### 8.4 Lo que la IA no puede reemplazar en este proyecto

| Actividad | Por qué requiere criterio humano |
|---|---|
| Decisiones de arquitectura | Implican trade-offs con el contexto real del equipo, deuda técnica existente y roadmap del producto |
| Definición de contratos (interfaces) | El contrato define el modelo mental del sistema; debe venir del entendimiento del dominio |
| Juicio sobre qué testear | Requiere conocer qué puede fallar en producción, no solo qué puede fallar en teoría |
| Revisión de seguridad | La IA puede proponer técnicas, pero la validación de que el pinning es correcto requiere verificación contra fuentes oficiales |
| Code review de PRs | La IA no tiene contexto del historial del equipo, los acuerdos implícitos ni las restricciones del negocio |