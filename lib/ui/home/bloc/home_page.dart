import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utility.dart';
import '../../../core/widgets/animated_sized_and_fade.dart';
import '../../../data/data_sources/category_local_data_source.dart';
import '../../../domain/entity/category.dart';
import '../../../domain/entity/trending_event.dart';
import '../../../domain/entity/upcoming_event.dart';
import '../../event_details/event_details_page.dart';
import '../home_states.dart';
import 'home_bloc.dart';
import 'home_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Size _size;

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(HomeBlocLoadingState());
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return SafeArea(
      child: BlocProvider(
        create: (context) => _homeBloc..add(InitialBlocLoadEvent()),
        child: BlocBuilder<HomeBloc, HomeBlocState>(
          builder: (context, state) {
            if (state is HomeBlocSuccessState) {
              return Scaffold(
                backgroundColor: const Color(0xfff5f5f9),
                appBar: buildAppBar(state.uiState.profilePictureUrl),
                body: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildHidable16SizedBox(),
                        buildHideableHeadingTextView(
                            "Trending Events near you"),
                        buildHidable8SizedBox(),
                        buildTrendingPlaceList(),
                        buildHidable16SizedBox(),
                        buildHideableHeadingTextView("Category"),
                        buildHidable8SizedBox(),
                        buildCategoriesList(state.uiState.categories),
                        buildHidable16SizedBox(),
                        const Text(
                          "Upcoming Events",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 11.0),
                        buildUpcomingPlaceList(state.uiState.upcomingEvents),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is HomeBlocLoadingState) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is HomeBlocErrorState) {
              return const Center(child: Icon(CupertinoIcons.globe));
            } else {
              return const VisibleGoneContainer();
            }
          },
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

  Widget buildHidable8SizedBox() {
    return const SizedBox(height: 8.0);
  }

  Widget buildHidable16SizedBox() {
    return const SizedBox(height: 16.0);
  }

  Widget buildTrendingPlaceList() {
    return BlocBuilder<HomeBloc, HomeBlocState>(builder: (context, state) {
      return AnimatedSizeAndFade(
        child: state is HomeBlocSuccessState
            ? SizedBox(
                height: _size.height * 0.25,
                child: ListView.builder(
                  itemCount: state.uiState.trendingEvents.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildTrendingEventCard(
                        context, state.uiState.trendingEvents[index], index);
                  },
                ),
              )
            : const VisibleGoneContainer(),
      );
    });
  }

  Widget buildUpcomingPlaceList(List<UpcomingEvent> upcomingEvents) {
    return Flexible(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: upcomingEvents.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final upcomingEvent = upcomingEvents[index];
          return buildUpcomingEventCard(context, upcomingEvent, index);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 4.0,
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
          elevation: 0.1,
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

  Widget buildCategoriesList(List<Category> categories) {
    return SizedBox(
      height: _size.height * 0.12,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return buildCategoryCard(context, category);
        },
      ),
    );
  }

  Widget buildCategoryCard(BuildContext context, Category category) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: _size.height * 0.12,
      height: _size.height * 0.12,
      child: Card(
        borderOnForeground: true,
        elevation: 0.5,
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
        margin: const EdgeInsets.only(right: 12.0),
        width: _size.width * 0.80,
        height: _size.height * 0.25,
        child: Card(
          elevation: 0.1,
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

  AppBar buildAppBar(String profilePictureUrl) {
    final sliverAppbar = SizedBox(
      width: _size.width,
      height: _size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("images/splash_logo.svg",
              height: _size.height * 0.05, width: _size.height * 0.05),
          Expanded(child: Container()),
        ],
      ),
    );

    final appBar = AppBar(
      elevation: 0.1,
      backgroundColor: const Color(0xfff5f5f9),
      leading: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          child: SvgPicture.asset("images/splash_logo.svg"),
          height: 30,
          width: 30,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => showProfileBottomSheet(_size),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                height: 30,
                width: 30,
                child: loadNetworkImage(
                  url: profilePictureUrl,
                ),
              ),
            ),
          ),
        )
      ],
    );

    return appBar;
  }

  Future<void> showProfileBottomSheet(Size size) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: _size.height * 0.7,
          color: const Color(0xFF737373),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xfff5f5f9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: _size.height * 0.03),
                  loadRoundedNetworkImage(
                    url: loadRandomImageUrl(),
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    faker.person.name(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${faker.address.state()}, ${faker.address.country()}",
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${faker.lorem.sentence()} ${faker.lorem.sentence()} ${faker.lorem.sentence()}",
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(child: Container()),
                  CupertinoButton.filled(
                    child: const Text("Log Out"),
                    onPressed: () async => _showLogOutAlertDialog(context),
                  ),
                  CupertinoButton(
                    child: const Text("Go To Profile"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    child: const Text("Cancel"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future _showLogOutAlertDialog(BuildContext context) {
    Navigator.pop(context);
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          "Log Out",
        ),
        content: const Text(
            "Are you sure you want to log out? You need to be logged in to access all the features of the app."),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            isDefaultAction: true,
            child: const Text("Log Out"),
            textStyle: const TextStyle(color: Color(0xff232ED1)),
          ),
          CupertinoDialogAction(
            textStyle: const TextStyle(color: Color(0xff232ED1)),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }
}

class VisibleGoneContainer extends StatelessWidget {
  const VisibleGoneContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
