# Pokédex Favorites

<p align="center">
  <img src="assets/images/onboarding_1.png" alt="Pokédex Favorites" width="120"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.22+-02569B?logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-3.3+-0175C2?logo=dart" />
  <img src="https://img.shields.io/badge/Architecture-Clean%20Architecture-brightgreen" />
  <img src="https://img.shields.io/badge/State-Riverpod-purple" />
  <img src="https://img.shields.io/badge/License-MIT-blue" />
</p>

> Prueba técnica — **Global66 · Front End Developer (Flutter)**
> Aplicación móvil para explorar Pokémon, ver su detalle y gestionar una lista
> de favoritos persistida de forma segura en el dispositivo.

---

## Tabla de Contenidos

1. [Demo](#1-demo)
2. [Requisitos previos](#2-requisitos-previos)
3. [Cómo correr el proyecto](#3-cómo-correr-el-proyecto)
4. [Cómo ejecutar los tests](#4-cómo-ejecutar-los-tests)
5. [Estructura del proyecto](#5-estructura-del-proyecto)
6. [Documentación](#6-documentación)
7. [Arquitectura](#7-arquitectura)
8. [Tecnologías utilizadas](#8-tecnologías-utilizadas)
9. [Capas de seguridad](#9-capas-de-seguridad)
10. [Internacionalización (I18N)](#10-internacionalización-i18n)
11. [Uso de Inteligencia Artificial](#11-uso-de-inteligencia-artificial)

---

## 1. Demo

| Lista | Detalle | Favoritos | Perfil |
|:---:|:---:|:---:|:---:|
| ![list](docs/screenshots/list.png) | ![detail](docs/screenshots/detail.png) | ![favorites](docs/screenshots/favorites.png) | ![profile](docs/screenshots/profile.png) |

---

## 2. Requisitos previos

| Herramienta | Versión mínima | Verificar |
|---|---|---|
| Flutter SDK | 3.41.3 | `flutter --version` |
| Dart SDK | 3.11.1 | `dart --version` |
| Xcode (macOS) | 15.0 | `xcodebuild -version` |
| Android Studio / SDK | API 21+ | `sdkmanager --list` |
| CocoaPods (macOS) | 1.14+ | `pod --version` |

> **Nota:** La aplicación soporta Android 5.0+ (API 21) e iOS 13+.

---

## 3. Cómo correr el proyecto

### 3.1 Clonar el repositorio

```bash
git clone https://github.com/MiguelOquendoRincon/pokedex-global66.git
cd pokedex-global66
```

### 3.2 Instalar dependencias

```bash
flutter pub get
```

### 3.3 Generar código

Los archivos `.g.dart` y `.freezed.dart` **no se suben al repositorio** (ver `.gitignore`).
Deben generarse localmente antes de compilar:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Para modo watch durante el desarrollo:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### 3.4 Generar localizaciones

```bash
flutter gen-l10n
```

> Si `generate: true` está activo en `pubspec.yaml`, este paso ocurre
> automáticamente con `flutter pub get`.

### 3.5 Correr la aplicación

```bash
# Dispositivo/emulador por defecto
flutter run

# Android específico
flutter run -d emulator-5554

# iOS específico
flutter run -d "iPhone 15 Pro"

# Release build (activa certificate pinning y supresión de logs)
flutter run --release
```

### 3.6 Build de producción

```bash
# Android — APK
flutter build apk --release --obfuscate --split-debug-info=build/symbols

# Android — App Bundle (recomendado para Play Store)
flutter build appbundle --release --obfuscate --split-debug-info=build/symbols

# iOS
flutter build ipa --release --obfuscate --split-debug-info=build/symbols
```

> `--obfuscate` + `--split-debug-info` activan la ofuscación del código Dart,
> dificultando el reverse engineering del APK/IPA.

---

## 4. Cómo ejecutar los tests

### Todos los tests

```bash
flutter test
```

### Con cobertura

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html   # macOS
```

### Tests por feature

```bash
# Use cases de la lista de pokémon
flutter test test/features/pokemon_list/

# Use cases de favoritos (incluye serialización y toggle puro)
flutter test test/features/favorites/

# Use cases del detalle
flutter test test/features/pokemon_detail/

# Infraestructura core
flutter test test/core/
```

### Análisis estático

```bash
# Linting estándar
flutter analyze

# Riverpod lint (detecta patrones incorrectos de providers)
dart run custom_lint
```

---

## 5. Estructura del proyecto

```
lib/
├── main.dart                        # Punto de entrada → bootstrap()
├── bootstrap.dart                   # Init: bindings, DI, error hooks
├── app.dart                         # MaterialApp.router + I18N + Theme
│
├── core/
│   ├── di/                          # Providers globales reutilizables
│   ├── error/                       # AppException (sealed) + FailureHandler
│   ├── network/                     # DioClient + interceptores
│   ├── observability/               # Talker + RiverpodObserver
│   ├── router/                      # GoRouter con rutas tipadas
│   ├── security/                    # CertPinning + SecureLocalStorage
│   ├── shell/                       # MainShell (BottomNavigationBar)
│   ├── storage/                     # ILocalStorage interface
│   ├── theme/                       # AppTheme light/dark + extensions
│   └── l10n/                        # ARB files + extensión context.l10n
│
└── features/
    ├── splash/                      # Pantalla de carga con pre-carga de datos
    ├── onboarding/                  # Onboarding de 2 páginas
    ├── pokemon_list/                # Lista paginada + búsqueda + filtro tipo
    ├── pokemon_detail/              # Detalle con stats, tipos y favorito
    ├── favorites/                   # Lista de favoritos con swipe-to-delete
    ├── regions/                     # "Muy pronto disponible"
    └── profile/                     # Dark mode switch + selector de idioma

test/
├── core/network/
└── features/
    ├── favorites/
    │   ├── domain/                  # Lógica de toggle y validación
    │   └── presentation/providers/  # Notifier de favoritos
    ├── onboarding/
    │   └── presentation/providers/  # Notifier de onboarding
    ├── pokemon_detail/
    │   ├── data/repositories/       # Repo de detalle (mapping, mappers, etc)
    │   ├── domain/                  # Entidades de detalle
    │   └── presentation/providers/  # Notifier de detalle
    └── pokemon_list/
        ├── data/repositories/       # Repo de lista (pagination, mappers, etc)
        ├── domain/                  # Entidades de lista
        └── presentation/
            ├── providers/           # PokémonListNotifier & Cache
            ├── screens/             # Widget tests de pantallas (states)
            └── widgets/             # Widget tests de búsqueda y cards
```

---

## 6. Arquitectura

La aplicación implementa **Clean Architecture** con organización **Feature-First**,
manejo funcional de errores mediante **Railway-Oriented Programming** (`TaskEither`)
y gestión de estado + DI con **Riverpod**.

```
Presentation  ──►  Domain  ──►  Data  ──►  Remote / Local
(Providers,        (Entities,    (Models,    (PokéAPI REST /
 Screens,           Use Cases,    Repos,      SecureStorage)
 Widgets)           Interfaces)   Datasources)
```

La regla de dependencia es estricta: las capas internas no conocen las externas.
`Domain` no importa nada de `Data`; `Data` no importa nada de `Presentation`.

> 📐 **Decisiones arquitectónicas detalladas, comparación con alternativas descartadas
> y diagramas de flujo:** [`ARCHITECTURE.md — Secciones 2 y 3`](./ARCHITECTURE.md#2-arquitectura-elegida-clean-architecture--feature-first)

---

## 8. Tecnologías utilizadas

| Paquete | Rol |
|---|---|
| `flutter_riverpod` + `riverpod_annotation` | Estado reactivo + inyección de dependencias |
| `freezed` + `json_serializable` | Inmutabilidad, sealed unions, serialización |
| `fpdart` | `Either` / `TaskEither` — manejo funcional de errores |
| `dio` | Cliente HTTP con pipeline de interceptores |
| `go_router` | Navegación declarativa con `ShellRoute` y redirect reactivo |
| `flutter_secure_storage` | Favoritos cifrados (Keychain / EncryptedSharedPreferences) |
| `talker_flutter` | Observabilidad: logs estructurados + viewer in-app |
| `cached_network_image` | Caché de imágenes con shimmer placeholder |
| `shimmer` | Skeleton loaders durante la carga inicial |
| `lottie` | Animación de pokeball en estados de carga |
| `shared_preferences` | Persistencia de preferencias de onboarding y tema |
| `palette_generator` | Color dinámico de fondo a partir del sprite del Pokémon |

> 📦 **Justificación de cada paquete frente a sus alternativas:**
> [`ARCHITECTURE.md — Sección 6`](./ARCHITECTURE.md#6-stack-tecnológico--justificación)

---

## 9. Capas de seguridad

Se implementaron tres capas de seguridad orientadas a los vectores de ataque
reales de una aplicación móvil con API pública:

| Capa | Qué protege |
|---|---|
| **Certificate Pinning** | Ataques MITM mediante proxies (Charles, mitmproxy) |
| **Cifrado de datos en reposo** | Lectura de favoritos en dispositivos rooteados o backups ADB |
| **Supresión de logs en producción** | Fuga de internals por `adb logcat` en builds release |

Adicionalmente, los builds de producción se compilan con `--obfuscate`
para dificultar el reverse engineering del bytecode Dart.

> 🔐 **Explicación técnica completa de cada capa, diagramas de flujo,
> estrategia de rotación de certificados y tabla de superficie de ataque cubierta:**
> [`ARCHITECTURE.md — Sección 7`](./ARCHITECTURE.md#7-capas-de-seguridad)

---

## 10. Internacionalización (I18N)

La aplicación soporta **inglés** y **español**. El idioma se puede cambiar
en runtime desde la pantalla de Perfil sin reiniciar la app.

- Los textos viven en `lib/core/l10n/app_en.arb` y `lib/core/l10n/app_es.arb`.
- El código se genera con `flutter gen-l10n` en `lib/core/l10n/generated/`.
- Los widgets acceden a las cadenas con `context.l10n.clave` (extensión de contexto).
- El locale activo se persiste y se expone como provider Riverpod (`LocaleNotifier`).

Para agregar un nuevo idioma:

```bash
# 1. Crear lib/core/l10n/app_fr.arb con las traducciones
# 2. Regenerar
flutter gen-l10n
# 3. Agregar el Locale al supportedLocales si es necesario
```

---

## 11. Uso de Inteligencia Artificial

Se utilizó IA generativa (Claude — Anthropic, Gemini — Google Deepmind) como **copiloto estructurado**
durante el desarrollo. El uso siguió un contrato estricto de gobernanza donde
el desarrollador define contratos e interfaces; la IA propone implementaciones;
el desarrollador revisa, valida y decide.

**Áreas de uso concreto:**

- **Detección de flujos críticos** — identificación de condiciones de carrera
  en el flujo de favoritos e inicialización del router.
- **Documentación** — borrador de docstrings para clases de infraestructura,
  revisados para verificar precisión técnica.
- **Tests unitarios** — el desarrollador define los casos de prueba en comentarios;
  la IA genera el código; el desarrollador valida assertions y mocks.
- **Revisión de patrones** — validación de coherencia entre ADRs y la implementación.

> 🤖 **Contrato completo de gobernanza (12 reglas de entrada, revisión y salida),
> flujo de trabajo con IA para tests, y límites de lo que la IA no puede reemplazar:**
> [`ARCHITECTURE.md — Sección 8`](./ARCHITECTURE.md#8-uso-de-inteligencia-artificial)

---

## Contacto

Desarrollado por **Miguel Oquendo Rincon** 
· 📧 [Email](mailto:miguel.oquendo.dev@gmail.com) 
· 🐙 [GitHub](https://github.com/MiguelOquendoRincon) 
· 👔 [LinkedIn](https://www.linkedin.com/in/miguel-angel-oquendo-rincon) 
· 🌐 [Portafolio](https://miguel-oquendo-portfolio.vercel.app/)

---

<p align="center">
  Hecho con ❤️ y mucho café ☕
</p>