/// Extension on [String] providing common text utilities.
extension StringX on String {
  /// Returns this string with the first character capitalised.
  /// Empty strings are returned unchanged.
  String get capitalised =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
