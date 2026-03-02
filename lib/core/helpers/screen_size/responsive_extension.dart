import 'package:flutter/material.dart';

import 'package:pokedex_global66/core/helpers/screen_size/responsive_util.dart';

extension ResponsiveContext on BuildContext {
  ResponsiveUtil get responsive => ResponsiveUtil(this);
}
