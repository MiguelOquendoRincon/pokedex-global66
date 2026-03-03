import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';

import 'package:pokedex_global66/core/theme/tokens/colors.dart';

class PokemonSearchBar extends StatefulWidget {
  const PokemonSearchBar({
    required this.hint,
    required this.onChanged,
    super.key,
  });

  final String hint;
  final ValueChanged<String> onChanged;

  @override
  State<PokemonSearchBar> createState() => _PokemonSearchBarState();
}

class _PokemonSearchBarState extends State<PokemonSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // InputDecorationTheme from AppTheme handles fill color & borders —
    // we only override what's specific to this widget.
    return TextField(
      controller: _controller,
      onChanged: (v) {
        setState(() {}); // rebuild to show/hide clear button
        widget.onChanged(v);
      },
      style: TextStyle(color: context.textPrimary, fontSize: 14),
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(Icons.search, color: context.textSecondary),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.close, color: context.textSecondary),
                onPressed: () {
                  _controller.clear();
                  setState(() {});
                  widget.onChanged('');
                },
              )
            : null,
        // fillColor & border come from InputDecorationTheme in AppTheme
      ),
    );
  }
}
