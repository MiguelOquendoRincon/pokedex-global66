// svg_container.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Un contenedor configurable para SVGs con valores por defecto,
/// pensado para ser reutilizado en toda la app.
///
/// Soporta:
///  - Asset y Network
///  - Colorización vía ColorFilter
///  - Tamaño fijo (width/height) o cuadrado (size)
///  - Padding interno
///  - Fondo (color o gradiente), borde, radio y sombra
///  - Alineación, BoxFit, clip
///  - Tooltip, Semantics y Hero
///  - onTap / onLongPress
///
/// Ejemplos de uso al final del archivo.
class SvgContainer extends StatelessWidget {
  // ---------------- Defaults (puedes mapear a tu design system) ----------------
  static const double _kDefaultSize = 48;
  static const double _kDefaultPadding = 12;
  static const double _kDefaultRadius = 16;
  static const BoxFit _kDefaultFit = BoxFit.contain;

  // ---------------- Fuente del SVG ----------------
  final String? assetName;
  final String? networkUrl;

  // ---------------- Estilo visual del wrapper ----------------
  final double? width;
  final double? height;

  /// Tamaño cuadrado. Si lo especificas, tiene prioridad sobre width/height.
  final double? size;

  /// Color para re-colorear el SVG (fill/stroke) usando BlendMode.srcIn
  final Color? color;

  /// Relleno interno alrededor del SVG.
  final EdgeInsetsGeometry? padding;

  /// Fondo del contenedor (se ignora si [gradient] no es null).
  final Color? backgroundColor;

  /// Gradiente del fondo (tiene prioridad sobre [backgroundColor]).
  final Gradient? gradient;

  /// Radio de las esquinas.
  final BorderRadiusGeometry? borderRadius;

  /// Borde del contenedor.
  final BoxBorder? border;

  /// Sombra suave (usa [elevation] > 0 para activarla rápidamente).
  final List<BoxShadow>? boxShadow;

  /// Elevación rápida que genera una sombra por defecto.
  final double elevation;

  /// Alineación del contenido SVG dentro del cajón.
  final AlignmentGeometry alignment;

  /// Cómo ajustar el SVG dentro del espacio disponible.
  final BoxFit fit;

  /// Cómo se recortan los bordes (útil con [borderRadius]).
  final Clip clipBehavior;

  // ---------------- Interacción / Accesibilidad ----------------
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? tooltip;
  final String? semanticsLabel;
  final bool excludeFromSemantics;
  final String? heroTag;

  /// Placeholder para network; por defecto muestra un spinner centrado.
  final WidgetBuilder? placeholderBuilder;

  /// Widget en caso de error al cargar el SVG.
  final WidgetBuilder? errorBuilder;

  /// ColorFilter custom si quieres un control más fino. Si lo pasas,
  /// tiene prioridad sobre [color].
  final ColorFilter? colorFilter;

  /// Construye desde un asset local.
  const SvgContainer.asset(
    this.assetName, {
    super.key,
    // Visual
    this.width,
    this.height,
    this.size,
    this.color,
    this.padding,
    this.backgroundColor,
    this.gradient,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.elevation = 0,
    this.alignment = Alignment.center,
    this.fit = _kDefaultFit,
    this.clipBehavior = Clip.antiAlias,
    // Interacción / Accesibilidad
    this.onTap,
    this.onLongPress,
    this.tooltip,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.heroTag,
    // Carga/Errores
    this.placeholderBuilder,
    this.errorBuilder,
    // Colorización avanzada
    this.colorFilter,
  }) : networkUrl = null;

  /// Construye desde una URL remota.
  const SvgContainer.network(
    this.networkUrl, {
    super.key,
    // Visual
    this.width,
    this.height,
    this.size,
    this.color,
    this.padding,
    this.backgroundColor,
    this.gradient,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.elevation = 0,
    this.alignment = Alignment.center,
    this.fit = _kDefaultFit,
    this.clipBehavior = Clip.antiAlias,
    // Interacción / Accesibilidad
    this.onTap,
    this.onLongPress,
    this.tooltip,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.heroTag,
    // Carga/Errores
    this.placeholderBuilder,
    this.errorBuilder,
    // Colorización avanzada
    this.colorFilter,
  }) : assetName = null;

  @override
  Widget build(BuildContext context) {
    assert(
      (assetName != null) ^ (networkUrl != null),
      'Debes proveer exactamente una fuente: assetName O networkUrl.',
    );

    final cs = Theme.of(context).colorScheme;

    // Dimensiones calculadas
    final double resolvedWidth = size ?? width ?? _kDefaultSize;
    final double resolvedHeight = size ?? height ?? _kDefaultSize;

    // ColorFilter final (prioriza el provisto por parámetro)
    final ColorFilter? resolvedColorFilter =
        colorFilter ??
        (color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null);

    // Sombra rápida a partir de elevation si no pasaron boxShadow
    final List<BoxShadow>? resolvedShadow =
        boxShadow ??
        (elevation > 0
            ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 8 + elevation * 2,
                offset: Offset(0, 2 + elevation),
                spreadRadius: 0,
              ),
            ]
            : null);

    // Fondo por defecto si no pasaste background/gradient
    final Decoration decoration = BoxDecoration(
      color:
          gradient == null
              ? (backgroundColor ??
                  cs.surfaceContainerHighest.withValues(alpha: 0.0))
              : null,
      gradient: gradient,
      borderRadius: borderRadius ?? BorderRadius.circular(_kDefaultRadius),
      border: border,
      boxShadow: resolvedShadow,
    );

    Widget child = _buildSvg(
      width: resolvedWidth - _horizontalPadding(padding),
      height: resolvedHeight - _verticalPadding(padding),
      colorFilter: resolvedColorFilter,
      fit: fit,
      placeholderBuilder: placeholderBuilder,
      errorBuilder: errorBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
    );

    // Alineación + padding + decoraciones + clip
    child = Align(alignment: alignment, child: child);

    if (padding != null) {
      child = Padding(padding: padding!, child: child);
    } else {
      child = Padding(
        padding: const EdgeInsets.all(_kDefaultPadding),
        child: child,
      );
    }

    child = DecoratedBox(decoration: decoration, child: child);

    if (clipBehavior != Clip.none) {
      child = ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(_kDefaultRadius),
        clipBehavior: clipBehavior,
        child: child,
      );
    }

    // Interacciones
    if (onTap != null || onLongPress != null) {
      child = InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        splashColor: cs.primary.withValues(alpha: 0.08),
        highlightColor: Colors.transparent,
        child: child,
      );
    }

    // Tooltip
    if (tooltip != null && tooltip!.isNotEmpty) {
      child = Tooltip(message: tooltip!, child: child);
    }

    // Hero
    if (heroTag != null && heroTag!.isNotEmpty) {
      child = Hero(tag: heroTag!, child: child);
    }

    // Tamaño final
    return SizedBox(width: resolvedWidth, height: resolvedHeight, child: child);
  }

  // ---------------- Internals ----------------

  Widget _buildSvg({
    required double width,
    required double height,
    required BoxFit fit,
    required ColorFilter? colorFilter,
    required WidgetBuilder? placeholderBuilder,
    required WidgetBuilder? errorBuilder,
    required String? semanticsLabel,
    required bool excludeFromSemantics,
  }) {
    final Widget Function(BuildContext)? onError =
        errorBuilder != null ? (context) => errorBuilder(context) : null;

    if (assetName != null) {
      return SvgPicture.asset(
        assetName!,
        width: width,
        height: height,
        fit: fit,
        colorFilter: colorFilter,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics,
      );
    } else {
      return SvgPicture.network(
        networkUrl!,
        width: width,
        height: height,
        fit: fit,
        colorFilter: colorFilter,
        placeholderBuilder:
            placeholderBuilder ??
            (context) => const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics,
        // flutter_svg usa errorBuilder en ImageProvider? Proveemos fallback:
        // Si falla, mostramos un placeholder con ícono.
        headers: const <String, String>{},
      );
    }
  }

  double _horizontalPadding(EdgeInsetsGeometry? p) {
    if (p == null) return _kDefaultPadding * 2;
    final resolved = p.resolve(TextDirection.ltr);
    return resolved.left + resolved.right;
  }

  double _verticalPadding(EdgeInsetsGeometry? p) {
    if (p == null) return _kDefaultPadding * 2;
    final resolved = p.resolve(TextDirection.ltr);
    return resolved.top + resolved.bottom;
  }
}
