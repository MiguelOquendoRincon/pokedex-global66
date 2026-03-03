import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_preview.freezed.dart';

/// Enriched summary: combines the list-endpoint data (name, id)
/// with the minimum fields from the detail endpoint (primaryType, imageUrl)
/// needed to render a fully styled card without a second lazy fetch.
///
/// This is NOT [PokemonDetail] — it carries only what the card needs.
/// Keeping it separate respects ISP and avoids over-fetching.
@freezed
sealed class PokemonPreview with _$PokemonPreview {
  const factory PokemonPreview({
    required int id,
    required String name,
    required List<String> types,
    required String imageUrl,
  }) = _PokemonPreview;

  const PokemonPreview._();

  String get primaryType => types.isNotEmpty ? types.first : 'normal';

  String get displayName =>
      name.isEmpty ? name : '${name[0].toUpperCase()}${name.substring(1)}';

  String get formattedId => '#${id.toString().padLeft(3, '0')}';
}
