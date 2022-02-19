import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/kiwi.dart';

import '../../core/utility.dart';
import '../../domain/entity/city.dart';
import '../../domain/entity/event.dart';
import '../../domain/entity/interest.dart';
import '../../domain/use_cases/get_interests.dart';
import '../../domain/use_cases/get_nearby_events.dart';
import '../../domain/use_cases/get_popular_cities.dart';
import '../event_details/event_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchUiState _uiState = SearchUiState();
  late Size _size;

  final KiwiContainer _container = KiwiContainer();

  @override
  void initState() {
    _loadAllData();
    super.initState();
  }

  void _loadAllData() async {
    setState(() {
      _uiState.isLoading = true;
    });

    GetInterests getInterests = _container.resolve<GetInterests>();
    GetPopularCities getPopularCities = _container.resolve<GetPopularCities>();
    GetNearbyEvents getNearbyEvents = _container.resolve<GetNearbyEvents>();

    getInterests.getInterests().then((value) => setState(() {
          debugPrint("interests " + value.toString());
          _uiState.interests = value;
        }));

    getPopularCities.getCities().then((value) => setState(() {
          debugPrint("popular cities " + value.toString());
          _uiState.cities = value;
        }));

    getNearbyEvents.getNearbyEvents().then((value) => setState(
          () {
            debugPrint("nearby events " + value.toString());
            _uiState.nearbyEvents = value;
            _uiState.isLoading = false;
          },
        ));
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f9),
        body: _uiState.isLoading
            ? const Center(child: CupertinoActivityIndicator())
            : Container(
                color: const Color(0xfff5f5f9),
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHidable11SizedBox(),
                      buildSearchField(),
                      buildHidable25SizedBox(),
                      buildHideableHeadingTextView("Search by Interest"),
                      buildHidable11SizedBox(),
                      buildInterestList(),
                      buildHidable25SizedBox(),
                      buildHideableHeadingTextView("Search by Popular Cities"),
                      buildHidable11SizedBox(),
                      buildPopularCityList(),
                      buildHidable25SizedBox(),
                      const Text(
                        "Currently in your city",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 11.0),
                      buildNearbyEventList(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildNearbyEventList() {
    return _uiState.nearbyEvents.isNotEmpty
        ? Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _uiState.nearbyEvents.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final upcomingEvent = _uiState.nearbyEvents[index];
                return buildNearbyEventCard(context, upcomingEvent, index);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 11.0,
                mainAxisSpacing: 11.0,
              ),
            ),
          )
        : const CupertinoActivityIndicator();
  }

  void _navigateToEventDetailsPage(BuildContext context, int index) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => EventDetailsPage(index: index),
      ),
    );
  }

  Widget buildNearbyEventCard(BuildContext context, Event event, int index) {
    return GestureDetector(
      onTap: () {
        _navigateToEventDetailsPage(context, index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        width: _size.width * 0.49,
        height: _size.height * 0.21,
        child: Card(
          elevation: 0.0,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Stack(
            children: [
              loadNetworkImage(
                url: event.imageUrl,
                fit: BoxFit.fill,
                height: _size.height * 0.40,
                width: _size.width * 0.49,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 49,
                  width: 49,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.name,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        event.address,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 10.0,
                            color: Color(0xff8f8f8f),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 12.0,
                top: 12.0,
                child: SvgPicture.asset(
                  "images/icon_save.svg",
                  height: event.isSaved ? 25 : 0.0,
                  width: event.isSaved ? 25 : 0.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInterestList() {
    return SizedBox(
      height: _size.height * 0.14,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _uiState.interests.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final interest = _uiState.interests[index];
          return buildInterestCard(context, interest);
        },
      ),
    );
  }

  Widget buildPopularCityList() {
    return SizedBox(
      height: _size.height * 0.14,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _uiState.cities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final city = _uiState.cities[index];
          return buildCityCard(context, city);
        },
      ),
    );
  }

  Widget buildCityCard(BuildContext context, City city) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: _size.height * 0.14,
      height: _size.height * 0.14,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            loadNetworkImage(
              url: city.imageUrl,
              fit: BoxFit.fill,
              width: _size.height * 0.14,
              height: _size.height * 0.14,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 25,
                width: 25,
                color: Colors.white,
                child: Center(
                  child: Text(
                    city.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInterestCard(BuildContext context, Interest interest) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: _size.height * 0.14,
      height: _size.height * 0.14,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            loadNetworkImage(
              url: interest.imageUrl,
              fit: BoxFit.fill,
              width: _size.height * 0.14,
              height: _size.height * 0.14,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 25,
                width: 25,
                color: Colors.white,
                child: Center(
                  child: Text(
                    interest.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHideableHeadingTextView(String text) {
    return SizedBox(
      height: 20.0,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildHidable25SizedBox() {
    return const SizedBox(height: 25.0);
  }

  Widget buildHidable11SizedBox() {
    return const SizedBox(height: 11.0);
  }

  Widget buildSearchField() {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      placeholder: "Search for events",
      autofocus: true,
      autocorrect: true,
      onSubmitted: (String text) {
        final snackBar = SnackBar(
          backgroundColor: Colors.white.withOpacity(0.9),
          content: SizedBox(
            width: _size.width,
            child: Text(
              "Searching for " + text,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
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
