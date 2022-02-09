import 'package:ecassion/core/widgets/animated_sized_and_fade.dart';
import 'package:ecassion/features/search/domain/entity/city.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';
import 'package:ecassion/features/search/domain/use_cases/get_interests.dart';
import 'package:ecassion/features/search/domain/use_cases/get_nearby_events.dart';
import 'package:ecassion/features/search/domain/use_cases/get_popular_cities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utility.dart';
import '../../home/presentation/pages/home_page.dart';
import '../domain/entity/event.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchUiState _uiState = SearchUiState();

  bool _shouldShowOtherList = true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _loadAllData();
    _setUpScrollingHidingAnimationListener();
    super.initState();
  }

  void _setUpScrollingHidingAnimationListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 50) {
        setState(() {
          _shouldShowOtherList = false;
        });
      } else if (_scrollController.position.pixels < 10) {
        setState(() {
          // _shouldShowOtherList = true;
        });
      }
    });
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
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    buildUpcomingPlaceList(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildUpcomingPlaceList() {
    return _uiState.nearbyEvents.isNotEmpty
        ? Expanded(
            child: GridView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: _uiState.nearbyEvents.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final upcomingEvent = _uiState.nearbyEvents[index];
                return buildUpcomingEventCard(context, upcomingEvent);
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

  Container buildUpcomingEventCard(BuildContext context, Event event) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 155.0,
      height: 155.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            loadNetworkImage(
              url: event.imageUrl,
              fit: BoxFit.fill,
              height: 155,
              width: 155,
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
    );
  }

  Widget buildInterestList() {
    return AnimatedSizeAndFade(
        child: _shouldShowOtherList
            ? SizedBox(
                height: 88.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _uiState.interests.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final interest = _uiState.interests[index];
                    return buildInterestCard(context, interest);
                  },
                ),
              )
            : const VisibleGoneContainer());
  }

  Widget buildPopularCityList() {
    return AnimatedSizeAndFade(
        child: _shouldShowOtherList
            ? SizedBox(
                height: 88.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _uiState.cities.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final city = _uiState.cities[index];
                    return buildCityCard(context, city);
                  },
                ),
              )
            : const VisibleGoneContainer());
  }

  Widget buildCityCard(BuildContext context, City city) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 88.0,
      height: 88.0,
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
              height: 88,
              width: 88,
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
      width: 88.0,
      height: 88.0,
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
              height: 88,
              width: 88,
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
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? SizedBox(
              height: 20.0,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : const VisibleGoneContainer(),
    );
  }

  Widget buildHidable25SizedBox() {
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? const SizedBox(height: 25.0)
          : const VisibleGoneContainer(),
    );
  }

  Widget buildHidable11SizedBox() {
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? const SizedBox(height: 11.0)
          : const VisibleGoneContainer(),
    );
  }

  TextField buildSearchField() {
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          CupertinoIcons.search,
          color: Colors.black54,
        ),
        prefixIconColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintStyle: const TextStyle(
          color: Color(0xff6C7072),
        ),
        hintText: "Search Events",
        fillColor: const Color(0xffF2F4F5),
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
