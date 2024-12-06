import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/favourite_provider.dart';
import 'package:flutter_weather_forecast/screen/detail%20screen/components/city_smart_widget.dart';
import 'package:flutter_weather_forecast/screen/favourite%20screen/components/fav_title.dart';
import 'package:flutter_weather_forecast/screen/favourite%20screen/components/fav_top_bar.dart';
import 'package:flutter_weather_forecast/screen/favourite%20screen/components/search_bar.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/loading_effect.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // TOP BAR SECTION
            const FavTopBar(),

            // Favourite title
            const TitleFav(),

            // SEARCH CONTAINER
            const FavSearchBar(),

            // CITY LIST
            context.watch<FavouriteProvider>().favLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: defPadding * 2),
                    child: LoadingEffect(),
                  )
                : const CitySmartWidget(),
          ],
        ),
      )),
    );
    ;
  }
}
