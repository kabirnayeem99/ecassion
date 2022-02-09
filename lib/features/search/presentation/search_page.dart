import 'package:ecassion/core/widgets/animated_sized_and_fade.dart';
import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';
import 'package:ecassion/features/search/domain/use_cases/get_interests.dart';
import 'package:ecassion/features/search/domain/use_cases/get_nearby_events.dart';
import 'package:ecassion/features/search/domain/use_cases/get_popular_cities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/entity/event.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchUiState _uiState = SearchUiState();

  @override
  void initState() {
    _loadAllData();
    super.initState();
  }

  void _loadAllData() async {
    setState(() {
      _uiState.isLoading = true;
    });
    GetInterests getInterests = GetInterests();
    GetPopularCities getPopularCities = GetPopularCities();
    GetNearbyEvents getNearbyEvents = GetNearbyEvents();

    getInterests.getInterests().then((value) => setState(
          () {
            _uiState.interests = value;
          },
        ));

    getPopularCities.getCities().then((value) => setState(
          () {
            _uiState.cities = value;
          },
        ));

    getNearbyEvents.getNearbyEvents().then((value) => setState(
          () {
            _uiState.nearbyEvents = value;
            _uiState.isLoading = false;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSizeAndFade(
        child: _uiState.isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : Column(
                children: [
                  Text(
                    _uiState.interests.toString(),
                    maxLines: 8,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _uiState.cities.toString(),
                    maxLines: 8,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _uiState.nearbyEvents.toString(),
                    maxLines: 8,
                  ),
                ],
              ),
      ),
    );
  }
}

class SearchUiState {
  bool isLoading = false;
  bool isSearching = false;
  List<Interest> interests = [];
  List<City> cities = [];
  List<Event> nearbyEvents = [];
}
