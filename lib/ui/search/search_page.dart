import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utility.dart';
import '../../domain/entity/city.dart';
import '../../domain/entity/event.dart';
import '../../domain/entity/interest.dart';
import '../event_details/event_details_page.dart';
import '../home/bloc/home_page.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_bloc_event.dart';
import 'bloc/search_bloc_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Size _size;

  SearchBloc? _searchBloc;

  late TextEditingController _searchFieldController;

  @override
  void initState() {
    _initBloc();
    _searchFieldController = TextEditingController();
    super.initState();
  }

  void _initBloc() {
    _searchBloc ??= SearchBloc(SearchBlocLoadingState())
      ..add(SearchBlocInitialLoadingEvent());
  }

  @override
  void dispose() {
    if (_searchBloc != null) {
      if (!_searchBloc!.isClosed) {
        _searchBloc!.close();
      }
    }
    _searchFieldController.dispose();
    super.dispose();
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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocProvider(
        create: (context) => _searchBloc ?? SearchBloc(SearchBlocLoadingState())
          ..add(SearchBlocInitialLoadingEvent()),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xfff5f5f9),
            body: BlocBuilder<SearchBloc, SearchBlocState>(
              builder: (context, state) {
                return Container(
                  child: _buildWholeAnimatedView(state),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWholeAnimatedView(SearchBlocState state) {
    if (state is SearchBlocLoadingState) {
      return _buildLoadingState();
    }
    if (state is SearchBlocNormalSuccessState) {
      return _buildPageOnNormalSuccess(state);
    }
    if (state is SearchBlocSearchingState) {
      return _buildSearchResultList(state);
    }
    return const VisibleGoneContainer();
  }

  Widget _buildSearchResultList(SearchBlocSearchingState state) {
    final events = state.searchResults;

    return Container(
      color: const Color(0xfff5f5f9),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHidable11SizedBox(),
            _buildSearchField(query: state.query),
            _buildHidable25SizedBox(),
            Text(
              _searchFieldController.text.isNotEmpty
                  ? "Search results for '${_searchFieldController.text}'"
                  : "Search results",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            _buildEventList(events),
          ],
        ),
      ),
    );
  }

  Widget _buildPageOnNormalSuccess(SearchBlocNormalSuccessState state) {
    final _cities = state.cities;
    final _interests = state.interests;
    final _nearbyEvents = state.nearbyEvents;

    return Container(
      color: const Color(0xfff5f5f9),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHidable11SizedBox(),
            _buildSearchField(),
            _buildHidable25SizedBox(),
            _buildHideableHeadingTextView("Search by Interest"),
            _buildHidable11SizedBox(),
            _buildInterestList(_interests),
            _buildHidable25SizedBox(),
            _buildHideableHeadingTextView("Search by Popular Cities"),
            _buildHidable11SizedBox(),
            _buildPopularCityList(_cities),
            _buildHidable25SizedBox(),
            const Text(
              "Currently in your city",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            _buildEventList(_nearbyEvents),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CupertinoActivityIndicator());
  }

  Widget _buildEventList(List<Event> events) {
    return Flexible(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: events.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final event = events[index];
          return _buildEventCard(context, event, index);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11.0,
          mainAxisSpacing: 11.0,
        ),
      ),
    );
  }

  void _navigateToEventDetailsPage(BuildContext context, int index) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => EventDetailsPage(index: index),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, Event event, int index) {
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
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        event.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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

  Widget _buildInterestList(List<Interest> interests) {
    return SizedBox(
      height: _size.height * 0.14,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: interests.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final interest = interests[index];
          return _buildInterestCard(context, interest);
        },
      ),
    );
  }

  Widget _buildPopularCityList(List<City> cities) {
    return SizedBox(
      height: _size.height * 0.14,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final city = cities[index];
          return _buildCityCard(context, city);
        },
      ),
    );
  }

  Widget _buildCityCard(BuildContext context, City city) {
    return GestureDetector(
      onTap: () {
        _searchBloc?.add(SearchBlocSearchByCityEvent(city: city));
      },
      child: Container(
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
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  height: 25,
                  width: _size.height * 0.14,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      city.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  Widget _buildInterestCard(BuildContext context, Interest interest) {
    return GestureDetector(
      onTap: () {
        _searchBloc?.add(SearchBlocSearchByInterestEvent(interest: interest));
      },
      child: Container(
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
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  height: 25,
                  width: _size.height * 0.13,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      interest.name,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  Widget _buildHideableHeadingTextView(String text) {
    return SizedBox(
      height: 20.0,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHidable25SizedBox() {
    return const SizedBox(height: 16.0);
  }

  Widget _buildHidable11SizedBox() {
    return const SizedBox(height: 8.0);
  }

  Widget _buildSearchField({String query = ""}) {
    if (query.isNotEmpty) {
      _searchFieldController.value = TextEditingValue(text: query);
    }

    return CupertinoSearchTextField(
      controller: _searchFieldController,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      placeholder: "Search for events",
      autocorrect: true,
      onChanged: (String text) {
        if (text.isEmpty) {
          _searchBloc?.add(SearchBlocAfterClearLoadingEvent());
        }
      },
      onSubmitted: (String text) {
        if (text.isNotEmpty) {
          _searchBloc?.add(SearchBlocSearchByQueryEvent(text));
        } else {
          _searchBloc?.add(SearchBlocInitialLoadingEvent());
        }
      },
    );
  }
}
