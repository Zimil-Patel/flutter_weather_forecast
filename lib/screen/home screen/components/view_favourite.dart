import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';

class ViewFavourtieCities extends StatelessWidget {
  const ViewFavourtieCities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: BlurryContainer(
                blur: 8,
                borderRadius: BorderRadius.circular(100),
                color: Colors.black54.withOpacity(0.5),
                child: const SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(defPadding / 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.view_agenda_outlined,
                          color: Colors.white,
                        ),
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
