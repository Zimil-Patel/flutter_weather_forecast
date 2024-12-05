import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/loading_effect.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/main_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.contains(ConnectivityResult.mobile) ||
                snapshot.data!.contains(ConnectivityResult.wifi)) {
              return provider.weatherModel != null
                  ? const MainScreen()
                  : const LoadingEffect();
            } else {
              return const LoadingEffect();
            }
          }

          return const CupertinoActivityIndicator(
            color: Colors.white,
          );
        },
      ),
    );
  }
}
