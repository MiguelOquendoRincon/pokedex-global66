import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_global66/core/theme/theme_extensions.dart';
import 'package:pokedex_global66/core/theme/tokens/colors.dart';
import 'package:pokedex_global66/features/pokemon_list/presentation/widgets/pokemon_filter_sheet.dart';

class PokemonSearchBar extends StatefulWidget {
  const PokemonSearchBar({
    required this.hint,
    required this.onChanged,
    this.searchQuery = '',
    this.initialFilters = const {},
    this.onFiltersChanged,
    super.key,
  });

  final String searchQuery;
  final String hint;
  final ValueChanged<String> onChanged;

  /// Current active filter types (from provider state) to pre-populate the sheet.
  final Set<String> initialFilters;

  /// Called when the user applies filters from the bottom sheet.
  final ValueChanged<Set<String>>? onFiltersChanged;

  @override
  State<PokemonSearchBar> createState() => _PokemonSearchBarState();
}

class _PokemonSearchBarState extends State<PokemonSearchBar> {
  final _controller = TextEditingController();

  // Mirrors widget.initialFilters but allows local optimistic updates
  // before the provider rebuilds.
  late Set<String> _activeFilters;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.searchQuery;
    _activeFilters = Set.from(widget.initialFilters);
  }

  @override
  void didUpdateWidget(PokemonSearchBar old) {
    super.didUpdateWidget(old);
    // Sync from provider when parent rebuilds (e.g. after clear-all).
    if (old.initialFilters != widget.initialFilters) {
      _activeFilters = Set.from(widget.initialFilters);
    }
    if (old.searchQuery != widget.searchQuery &&
        widget.searchQuery != _controller.text) {
      _controller.text = widget.searchQuery;
    }
  }

  Future<void> _openFilterSheet() async {
    final result = await showPokemonFilterSheet(
      context,
      initialTypes: _activeFilters,
    );
    if (result != null) {
      setState(() => _activeFilters = result);
      widget.onFiltersChanged?.call(result);
    }
  }

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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _activeFilters.isNotEmpty
                        ? AppColors.primary
                        : context.borderColor,
                    width: _activeFilters.isNotEmpty ? 1.8 : 1.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.slider_horizontal_3,
                    color: _activeFilters.isNotEmpty
                        ? AppColors.primary
                        : context.textSecondary,
                  ),
                  onPressed: _openFilterSheet,
                ),
              ),
              // Badge: active filter count
              if (_activeFilters.isNotEmpty)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${_activeFilters.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
