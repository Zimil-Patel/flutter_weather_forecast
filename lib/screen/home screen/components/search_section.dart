import 'dart:async';

import 'package:flutter/material.dart';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_forecast/provider/home_provider.dart';
import 'package:flutter_weather_forecast/utils/constant.dart';
import 'package:provider/provider.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(defPadding),
              decoration: BoxDecoration(
                color: provider.showSearchField
                    ? Colors.transparent
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: BlurryContainer(
                padding: EdgeInsets.zero,
                blur: 8,
                color: provider.showSearchField
                    ? Colors.black.withOpacity(0.4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SEARCH TEXT FIELD
                    SearchTextField(
                      provider: provider,
                    ),

                    const SizedBox(
                      width: defPadding,
                    ),

                    // SEARCH BUTTON
                    SearchButton(
                      provider: provider,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    Timer? _debounce;

    return Expanded(
      child: Visibility(
        visible: provider.showSearchField,
        child: TextFormField(
          onChanged: (value) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();

            _debounce = Timer(const Duration(milliseconds: 500), () {
              if (value.isNotEmpty && value.length > 2) {
                provider.getLocations(value); // API call
              }
            });
          },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          controller: provider.textCtrl,
          cursorColor: Colors.white,
          style: TextStyle(
            fontSize: height * 0.02,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: 'Search City',
            hintStyle: TextStyle(
                fontSize: height * 0.02, color: Colors.white.withOpacity(0.4)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: defPadding * 2,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.058,
      width: height * 0.058,
      margin: const EdgeInsets.all(defPadding / 1.4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          // TOGGLE SEARCH FIELD
          provider.toggleSearch();
        },
        child: BlurryContainer(
          blur: 6,
          height: height * 0.062,
          width: height * 0.062,
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.4),
          child: Icon(
            size: height * 0.03,
            Icons.search_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
