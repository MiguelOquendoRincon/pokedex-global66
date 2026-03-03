import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';

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
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 6,
          child: TextField(
            controller: _controller,
            onChanged: (v) {
              setState(() {}); // rebuild to show/hide clear button
              widget.onChanged(v);
            },
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: context.textPrimary),
            decoration: InputDecoration(
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: context.borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: context.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: context.focusBorderColor),
              ),
              hintStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: context.textSecondary),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: context.textSecondary,
              ),
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
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.borderColor),
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: Icon(
                CupertinoIcons.slider_horizontal_3,
                color: context.textSecondary,
              ),
              onPressed: () {
                _controller.clear();
                setState(() {});
                widget.onChanged('');
              },
            ),
          ),
        ),
      ],
    );
  }
}
