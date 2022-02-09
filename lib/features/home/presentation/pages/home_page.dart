import 'package:ecassion/core/utility.dart';
import 'package:ecassion/core/widgets/animated_sized_and_fade.dart';
import 'package:ecassion/features/event_details/presentation/event_details_page.dart';
import 'package:ecassion/features/home/domain/entity/category.dart';
import 'package:ecassion/features/home/domain/entity/trending_event.dart';
import 'package:ecassion/features/home/domain/entity/upcoming_event.dart';
import 'package:ecassion/features/home/domain/use_cases/get_categories.dart';
import 'package:ecassion/features/home/domain/use_cases/get_trending_event.dart';
import 'package:ecassion/features/home/domain/use_cases/get_upcoming_event.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _shouldShowOtherList = true;
  final _scrollController = ScrollController();

  final HomePageUiState _uiState = HomePageUiState();

  @override
  void initState() {
    _setUpScrollingHidingAnimationListener();
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

  void _setUpScrollingHidingAnimationListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 50) {
        setState(() {
          _shouldShowOtherList = false;
        });
      } else if (_scrollController.position.pixels < 10) {
        setState(() {
          _shouldShowOtherList = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight = statusBarHeight + kToolbarHeight;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ExtendedNestedScrollView(
            headerSliverBuilder: (BuildContext c, bool f) {
              return [buildAppBar()];
            },
            pinnedHeaderSliverHeightBuilder: () {
              return pinnedHeaderHeight;
            },
            onlyOneScrollInBody: true,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

  Widget buildHidable11SizedBox() {
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? const SizedBox(height: 11.0)
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

  Widget buildTrendingPlaceList() {
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? SizedBox(
              height: 199.0,
              child: ListView.builder(
                itemCount: _uiState.trendingEvents.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildTrendingEventCard(
                      context, _uiState.trendingEvents[index]);
                },
              ),
            )
          : const VisibleGoneContainer(),
    );
  }

  Widget buildUpcomingPlaceList() {
    return _uiState.upcomingEvents.isNotEmpty
        ? Expanded(
            child: GridView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: _uiState.upcomingEvents.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final upcomingEvent = _uiState.upcomingEvents[index];
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

  void _navigateToEventDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EventDetailsPage(),
      ),
    );
  }

  Widget buildUpcomingEventCard(
      BuildContext context, UpcomingEvent upcomingEvent) {
    return GestureDetector(
      onTap: () {
        _navigateToEventDetailsPage(context);
      },
      child: Container(
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
                url: upcomingEvent.imageUrl,
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
        child: _shouldShowOtherList
            ? SizedBox(
                height: 88.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _uiState.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = _uiState.categories[index];
                    return buildCategoryCard(context, category);
                  },
                ),
              )
            : const VisibleGoneContainer());
  }

  Widget buildCategoryCard(BuildContext context, Category category) {
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
              url: category.imageUrl,
              fit: BoxFit.fill,
              height: 88,
              width: 88,
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

  Widget buildTrendingEventCard(BuildContext context, TrendingEvent event) {
    return GestureDetector(
      onTap: () {
        _navigateToEventDetailsPage(context);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20.0),
        width: 312.0,
        height: 199.0,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(children: [
            loadNetworkImage(
              url: event.imageUrl,
              fit: BoxFit.fill,
              height: 199,
              width: 312,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 53,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                width: 312.0,
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
    final sliverAppbar = SliverAppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 30,
      leading:
          SvgPicture.asset("images/splash_logo.svg", height: 30, width: 30),
      actions: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: loadNetworkImage(
              url: _uiState.profilePictureUrl,
              height: 30,
              width: 30,
            ),
          ),
        )
      ],
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
    return const SizedBox(
      height: 0.0,
      width: 0.0,
    );
  }
}
