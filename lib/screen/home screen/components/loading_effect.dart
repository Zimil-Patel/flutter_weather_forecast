import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class LoadingEffect extends StatelessWidget {
  const LoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(
            color: Colors.white,
          ),
          SizedBox(
            height: defPadding,
          ),
          Text("Loading...")
        ],
      ),
    );
  }
}
