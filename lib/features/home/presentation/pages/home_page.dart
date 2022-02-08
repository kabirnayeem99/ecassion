import 'package:ecassion/core/utility.dart';
import 'package:ecassion/core/widgets/animated_sized_and_fade.dart';
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
  GetTrendingEvent _getTrendingEvent = GetTrendingEvent();
  GetUpcomingEvent _getUpcomingEvent = GetUpcomingEvent();
  GetCategories _getCategories = GetCategories();
  double test = 0;
  bool _shouldShowOtherList = true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        test = _scrollController.position.pixels;
        if (test > 150) {
          _shouldShowOtherList = false;
        } else if (test == 0) {
          _shouldShowOtherList = true;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight = statusBarHeight + kToolbarHeight;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
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
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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

  AnimatedSizeAndFade buildHideableHeadingTextView(String text) {
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? Container(
              height: 16.0,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : VisibleGoneContainer(),
    );
  }

  AnimatedSizeAndFade buildHidable11SizedBox() {
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? const SizedBox(height: 11.0)
          : VisibleGoneContainer(),
    );
  }

  AnimatedSizeAndFade buildHidable25SizedBox() {
    return AnimatedSizeAndFade(
      child: _shouldShowOtherList
          ? SizedBox(height: 25.0)
          : VisibleGoneContainer(),
    );
  }

  FutureBuilder<List<TrendingEvent>> buildTrendingPlaceList() {
    return FutureBuilder(
      future: _getTrendingEvent.getTrendingEvents(),
      builder:
          (BuildContext context, AsyncSnapshot<List<TrendingEvent>> snapshot) {
        if (snapshot.hasData) {
          return AnimatedSwitcher(
            duration: loadRandomDuration(),
            child: _shouldShowOtherList
                ? SizedBox(
                    height: 199.0,
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildTrendingEventCard(
                            context, snapshot.data![index]);
                      },
                    ),
                  )
                : Container(),
          );
        } else {
          return CupertinoActivityIndicator();
        }
      },
    );
  }

  FutureBuilder<List<UpcomingEvent>> buildUpcomingPlaceList() {
    return FutureBuilder(
      future: _getUpcomingEvent.getUpcomingEvents(),
      builder: (context, AsyncSnapshot<List<UpcomingEvent>> snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: GridView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final upcomingEvent = snapshot.data![index];
                return buildUpcomingEventCard(context, upcomingEvent);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 11.0,
                mainAxisSpacing: 11.0,
              ),
            ),
          );
        } else {
          return CupertinoActivityIndicator();
        }
      },
    );
  }

  Container buildUpcomingEventCard(
      BuildContext context, UpcomingEvent upcomingEvent) {
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
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      upcomingEvent.address,
                      maxLines: 1,
                      style: TextStyle(
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
    );
  }

  SizedBox buildCategoriesList() {
    return SizedBox(
      height: _shouldShowOtherList ? 88.0 : 0.0,
      child: FutureBuilder(
          future: _getCategories.getCategoryList(),
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = snapshot.data![index];
                  return buildCategoryCard(context, category);
                },
              );
            } else {
              return CupertinoActivityIndicator();
            }
          }),
    );
  }

  Container buildCategoryCard(BuildContext context, Category category) {
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
                height: 25,
                width: 25,
                color: Colors.white,
                child: Center(
                  child: Text(
                    category.name,
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTrendingEventCard(BuildContext context, TrendingEvent event) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      width: 312.0,
      height: 199.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          convertDateTimeToReadableString(event.time) +
                              " " +
                              event.address,
                          style: TextStyle(
                              fontSize: 10.0, color: Color(0xff8D8D8D)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    "BDT " + event.price.toString(),
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
    );
  }

  Widget buildAppBar() {
    final sliverAppbar = SliverAppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 30,
      leading: Container(
        child:
            SvgPicture.asset("images/splash_logo.svg", height: 30, width: 30),
      ),
      actions: [
        Container(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: loadNetworkImage(
                url:
                    "https://media.istockphoto.com/vectors/man-avatar-icon-man-flat-icon-man-faceless-avatar-man-character-vector-id1027705716?k=6&m=1027705716&s=170667a&w=0&h=aTAhPe2CvnQGIbI25T_d7XNZwNyumn5Xe1fOMfhELx4=",
                height: 30,
                width: 30,
              ),
            ),
          ),
        )
      ],
    );
    return sliverAppbar;
  }
}

class VisibleGoneContainer extends StatelessWidget {
  const VisibleGoneContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
}
