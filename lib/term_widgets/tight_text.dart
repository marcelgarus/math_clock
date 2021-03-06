import 'package:flutter/material.dart';

import 'theme.dart';

/// Displays text without space below the baseline.
///
/// Normally, [Text] has a bit of space below, because it may contain letters
/// that go below the baseline, like a lowercase "g" (apparently, these are
/// called "descending" letters).
/// We don't want that, because none of the characters we're going to render is
/// descending (we know that because all the digits and operations in the font
/// we use don't descend). That's why we use this widget.
///
/// This widget also uses the enclosing [TermTheme] to choose the color of the
/// text.
class TightText extends StatelessWidget {
  const TightText(this.data) : assert(data != null);

  final String data;

  @override
  Widget build(BuildContext context) {
    // Currently, there's no elegant way to disable the descent space, so we
    // just set the text's height to 0 and use manual padding to add space for
    // the text above the baseline.
    return Padding(
      padding: EdgeInsets.only(top: 48),
      child: Text(
        data,
        strutStyle: StrutStyle(height: 0, forceStrutHeight: true),
        style: TextStyle(
          fontFamily: 'Arvo',
          color: TermTheme.of(context).color,
          fontSize: 64,
        ),
      ),
    );
  }
}
