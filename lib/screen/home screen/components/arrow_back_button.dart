import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: CupertinoButton(
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        onPressed: () {
          context.read<FavouriteProvider>().isEditing = false;
          Navigator.pop(context);
        },
      ),
    );
  }
}
