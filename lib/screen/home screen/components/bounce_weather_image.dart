import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/animation_provider.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/favouriteButton.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/view_favourite.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

class BounceWeatherImage extends StatefulWidget {
  const BounceWeatherImage({super.key, required this.image});

  final String image;

  @override
  State<BounceWeatherImage> createState() => _BounceWeatherImageState();
}

class _BounceWeatherImageState extends State<BounceWeatherImage>
    with SingleTickerProviderStateMixin {
  late final AnimationProvider animationProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationProvider = Provider.of<AnimationProvider>(context, listen: false);
    animationProvider
        .initAnimationController(this); // Initialize animation controller here
  }

  @override
  void dispose() {
    animationProvider.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationProvider>(builder: (context, provider, child) {
      return Stack(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FavouriteButton(),
              ViewFavourtieCities(),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defPadding, vertical: defPadding * 4),
              child: AnimatedBuilder(
                animation: provider.animation!,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -20 * provider.animation!.value),
                    child: child,
                  );
                },
                child: Image.asset(
                  widget.image,
                  height: height * 0.22,
                  width: height * 0.22,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
