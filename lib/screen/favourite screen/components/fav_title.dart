import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/main.dart';
import 'package:flutter_weather_forecast/provider/favourite_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

class TitleFav extends StatelessWidget {
  const TitleFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: defPadding, top: defPadding * 1.5, bottom: defPadding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Favourties',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: height * 0.03,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
          const Spacer(),

          // EDIT BUTTON
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defPadding),
            padding: const EdgeInsets.all(defPadding * 0.01),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(100),
            ),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<FavouriteProvider>().toggleEditing();
              },
              child: Icon(
                size: height * 0.02,
                context.watch<FavouriteProvider>().isEditing
                    ? Icons.close_rounded
                    : Icons.edit,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          )
        ],
      ),
    );
  }
}
