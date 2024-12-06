import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeAnimatedButton extends StatelessWidget {
  const ThemeAnimatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeTrue = Provider.of<ThemeProvider>(context);
    var themeFalse = Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 400),
        tween:
            Tween<double>(begin: 0, end: themeTrue.isDark ? 6.2832 : -6.2832),
        builder: (context, value, child) => Transform.rotate(
          angle: value,
          child: CupertinoButton(
            child: Icon(
              !themeTrue.isDark ? Icons.sunny : Icons.nightlight_round,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            onPressed: () {
              themeFalse.toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}
