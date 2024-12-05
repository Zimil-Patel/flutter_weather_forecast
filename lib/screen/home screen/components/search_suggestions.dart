import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Visibility(
        visible: provider.showSearchField,
        child: provider.locationList.isNotEmpty
            ? Container(
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: defPadding),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: BlurryContainer(
                  blur: 5,
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black.withOpacity(0.4),
                  child: Column(
                    children: [
                      ...List.generate(
                        provider.locationList.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defPadding),
                            child: Column(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    // GET WEATHER FORECAST FOR SELECTED SEARCH VLAUE
                                    provider.getForecast(
                                        provider.locationList[index].name);
                                    provider.toggleSearch();
                                  },
                                  child: SizedBox(
                                    height: height * 0.055,
                                    child: Row(
                                      children: [
                                        // LOCATION MARKER ICON
                                        const Icon(
                                          color: Colors.white,
                                          Icons.location_on,
                                        ),

                                        // PADDING
                                        const SizedBox(
                                          width: defPadding,
                                        ),

                                        // CITY COUNTRY NAME
                                        Text(
                                          '${provider.locationList[index].name}, ${provider.locationList[index].country}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.018),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                index != provider.locationList.length - 1
                                    ? const Divider(
                                        color: Colors.white,
                                        thickness: 0.5,
                                        endIndent: defPadding,
                                        indent: defPadding,
                                        height: 5,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      );
    });
  }
}
