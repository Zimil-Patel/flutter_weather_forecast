import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/screen/home%20screen/components/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.contains(ConnectivityResult.mobile) ||
                snapshot.data!.contains(ConnectivityResult.wifi)) {
              return const MainScreen();
            }
          }

          return const CupertinoActivityIndicator();
        },
      ),
    );
  }
}
