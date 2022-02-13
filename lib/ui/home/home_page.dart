import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utility.dart';
import '../../core/widgets/animated_sized_and_fade.dart';
import '../../domain/entity/category.dart';
import '../../domain/entity/trending_event.dart';
import '../../domain/entity/upcoming_event.dart';
import '../../domain/use_cases/get_categories.dart';
import '../../domain/use_cases/get_trending_event.dart';
import '../../domain/use_cases/get_upcoming_event.dart';
import '../event_details/event_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final HomePageUiState _uiState = HomePageUiState();

  late Size _size;

  @override
  void initState() {
    _loadAllData();
    super.initState();
  }

  void _loadAllData() async {
    final GetTrendingEvent _getTrendingEvent = GetTrendingEvent();
    final GetUpcomingEvent _getUpcomingEvent = GetUpcomingEvent();
    final GetCategories _getCategories = GetCategories();

    _getCategories.getCategoryList().then((value) => {
          setState(() {
            _uiState.categories = value;
          })
        });

    _getUpcomingEvent.getUpcomingEvents().then((value) => {
          setState(() {
            _uiState.upcomingEvents = value;
          })
        });

    _getTrendingEvent.getTrendingEvents().then((value) => {
          setState(() {
            _uiState.trendingEvents = value;
            _uiState.isLoading = false;
          })
        });

    setState(() {
      _uiState.profilePictureUrl =
          "https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/a683a10f-9473-46dd-971a-3bc100917972/29-angryguybeard.jpg";
    });
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildAppBar(),
                buildHidable25SizedBox(),
                buildHideableHeadingTextView("Trending Events near you"),
                buildHidable11SizedBox(),
                buildTrendingPlaceList(),
                buildHidable25SizedBox(),
                buildHideableHeadingTextView("Category"),
                buildHidable11SizedBox(),
                buildCategoriesList(),
                buildHidable25SizedBox(),
                const Text(
                  "Upcoming Events",
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
        // ),
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

  Widget buildHidable11SizedBox() {
    return const SizedBox(height: 11.0);
  }

  Widget buildHidable25SizedBox() {
    return const SizedBox(height: 25.0);
  }

  Widget buildTrendingPlaceList() {
    return AnimatedSizeAndFade(
      child: _uiState.trendingEvents.isNotEmpty
          ? SizedBox(
              height: _size.height * 0.25,
              child: ListView.builder(
                itemCount: _uiState.trendingEvents.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildTrendingEventCard(
                      context, _uiState.trendingEvents[index], index);
                },
              ),
            )
          : const VisibleGoneContainer(),
    );
  }

  Widget buildUpcomingPlaceList() {
    return _uiState.upcomingEvents.isNotEmpty
        ? Flexible(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _uiState.upcomingEvents.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final upcomingEvent = _uiState.upcomingEvents[index];
                return buildUpcomingEventCard(context, upcomingEvent, index);
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
      MaterialPageRoute(
        builder: (context) => EventDetailsPage(index: index),
      ),
    );
  }

  Widget buildUpcomingEventCard(
      BuildContext context, UpcomingEvent upcomingEvent, int index) {
    return GestureDetector(
      onTap: () {
        _navigateToEventDetailsPage(context, index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        width: _size.width * 0.49,
        height: _size.height * 0.21,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Stack(
            children: [
              loadNetworkImage(
                url: upcomingEvent.imageUrl,
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
                  height: _size.width * 0.12,
                  width: _size.width * 0.49,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        upcomingEvent.name,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        upcomingEvent.address,
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
                  height: upcomingEvent.isSaved ? 25 : 0.0,
                  width: upcomingEvent.isSaved ? 25 : 0.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoriesList() {
    return AnimatedSizeAndFade(
      child: _uiState.categories.isNotEmpty
          ? SizedBox(
              height: _size.height * 0.12,
              child: ListView.builder(
                itemCount: _uiState.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = _uiState.categories[index];
                  return buildCategoryCard(context, category);
                },
              ),
            )
          : const VisibleGoneContainer(),
    );
  }

  Widget buildCategoryCard(BuildContext context, Category category) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: _size.height * 0.12,
      height: _size.height * 0.12,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            loadNetworkImage(
              url: category.imageUrl,
              fit: BoxFit.fill,
              height: _size.height * 01.2,
              width: _size.height * 0.12,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                height: 25,
                width: 25,
                color: Colors.white,
                child: Center(
                  child: Text(
                    category.name,
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

  Widget buildTrendingEventCard(
      BuildContext context, TrendingEvent event, int index) {
    return GestureDetector(
      onTap: () {
        _navigateToEventDetailsPage(context, index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20.0),
        width: _size.width * 0.80,
        height: _size.height * 0.25,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(children: [
            loadNetworkImage(
              url: event.imageUrl,
              fit: BoxFit.cover,
              height: _size.height * 0.20473251,
              width: _size.width * 0.80,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: _size.height * 0.05,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                width: _size.width * 0.80,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 183.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            event.name,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            convertDateTimeToReadableString(event.time) +
                                " " +
                                event.address,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 10.0, color: Color(0xff8D8D8D)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      "Rs " + event.price.toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff6564DB),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(16.0)),
                  color: Color(0xff6564DB),
                ),
                width: event.isTop ? 56.0 : 0,
                height: event.isTop ? 26.0 : 0.0,
                child: const Center(
                  child: Text(
                    "Top",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12.0,
              top: 12.0,
              child: SvgPicture.asset(
                "images/icon_save.svg",
                height: event.isSaved ? 25 : 0,
                width: event.isSaved ? 25 : 0,
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    final sliverAppbar = SizedBox(
      width: _size.width,
      height: _size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("images/splash_logo.svg",
              height: _size.height * 0.05, width: _size.height * 0.05),
          Expanded(child: Container()),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: loadNetworkImage(
              url: _uiState.profilePictureUrl,
              height: _size.height * 0.05,
              width: _size.height * 0.05,
            ),
          ),
        ],
      ),
    );

    return sliverAppbar;
  }
}

class HomePageUiState {
  List<TrendingEvent> trendingEvents = [];
  List<UpcomingEvent> upcomingEvents = [];
  List<Category> categories = [];
  bool isLoading = false;
  String message = "";
  String profilePictureUrl = "";
}

class VisibleGoneContainer extends StatelessWidget {
  const VisibleGoneContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
