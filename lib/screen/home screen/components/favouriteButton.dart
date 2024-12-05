import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/favourite_provider.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final favProvider = context.watch<FavouriteProvider>();

    final HomeProviderF = context.read<HomeProvider>();
    final favProviderF = context.read<FavouriteProvider>();

    favProviderF.checkIfContain(homeProvider.weatherModel!.location.name);

    return Padding(
      padding: const EdgeInsets.all(defPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                !favProvider.isFav
                    ? favProviderF.addToFav(homeProvider.weatherModel!)
                    : favProviderF.removeFromFav(
                        homeProvider.weatherModel!.location.name);
              },
              child: BlurryContainer(
                blur: 8,
                borderRadius: BorderRadius.circular(100),
                color: Colors.black54.withOpacity(0.5),
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(defPadding / 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        favProvider.isFav
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              )
                            : const Icon(
                                Icons.favorite_outline_rounded,
                                color: Colors.white,
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
