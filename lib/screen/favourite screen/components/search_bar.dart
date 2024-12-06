import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class FavSearchBar extends StatelessWidget {
  const FavSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: defPadding, vertical: defPadding / 2.5),
      padding: const EdgeInsets.all(defPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            'Search for city',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: height * 0.015,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const Spacer(),
          Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ],
      ),
    );
  }
}
