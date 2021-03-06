import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utility.dart';
import '../../core/widgets/animated_sized_and_fade.dart';
import '../../data/data_sources/category_local_data_source.dart';
import '../../domain/entity/event.dart';
import '../../domain/entity/event_details.dart';
import '../checkout/checkout_page.dart';
import '../home/bloc/home_page.dart';
import 'bloc/event_details_bloc.dart';
import 'bloc/event_details_events.dart';
import 'bloc/event_details_state.dart';

class EventDetailsPage extends StatefulWidget {
  final int index;

  const EventDetailsPage({Key? key, required this.index}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late Size _size;

  late EventDetailsBloc _eventDetailsBloc;

  var _index = 0;

  @override
  void initState() {
    _eventDetailsBloc = EventDetailsBloc(EventDetailsBlocLoadingState());
    _index = widget.index;
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    if (!_eventDetailsBloc.isClosed) {
      _eventDetailsBloc.close();
    }
    super.dispose();
  }

  void _navigateToEventDetailsPage(BuildContext context, int index) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => EventDetailsPage(index: index),
      ),
    );
  }

  void _navigateToCheckoutPage(BuildContext context, int index) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => CheckoutPage(index: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) =>
          _eventDetailsBloc..add(EventDetailsBlocInitialLoadingEvent(_index)),
      child: BlocBuilder<EventDetailsBloc, EventDetailsBlocState>(
          builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: buildBookNowButton(state),
          body: AnimatedSizeAndFade(
            child: state is EventDetailsBlocSuccessState
                ? SizedBox(
                    height: _size.height,
                    width: _size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildTopBar(_size, context,
                              state.eventDetailsUiState.eventDetails),
                          buildEventBySection(
                              state.eventDetailsUiState.eventDetails)[0],
                          buildEventBySection(
                              state.eventDetailsUiState.eventDetails)[1],
                          buildEventBySection(
                              state.eventDetailsUiState.eventDetails)[2],
                          const SizedBox(height: 25.0),
                          buildSecondHeader("About"),
                          const SizedBox(height: 11.0),
                          buildAboutText(
                              state.eventDetailsUiState.eventDetails),
                          const SizedBox(height: 11.0),
                          buildShareCard(
                              state.eventDetailsUiState.eventDetails),
                          const SizedBox(height: 17.0),
                          buildFirstHeader("Recommendations"),
                          buildRecommendedEventList(state.eventDetailsUiState
                              .eventDetails.recommendedEvents)
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: _size.height,
                    width: _size.width,
                    child: const CupertinoActivityIndicator(),
                  ),
          ),
        );
      }),
    );
  }

  Flexible buildRecommendedEventList(List<Event> recommendedEvents) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendedEvents.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              final recommendedEvent = recommendedEvents[index];
              return buildRecommendedEventCard(
                  context, recommendedEvent, index);
            }),
      ),
    );
  }

  Widget buildRecommendedEventCard(
      BuildContext context, Event event, int index) {
    return GestureDetector(
      onTap: () {
        _navigateToEventDetailsPage(context, index);
      },
      child: SizedBox(
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
                url: event.imageUrl,
                fit: BoxFit.cover,
                height: _size.height * 0.18,
                width: _size.width * 0.49,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: _size.height * 0.07,
                  width: _size.width * 0.49,
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
                  color: event.isSaved ? Colors.deepPurple : Colors.white,
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

  Container buildShareCard(EventDetails eventDetails) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: [
          const SizedBox(width: 11.0),
          eventDetails.sharedUsers.isNotEmpty
              ? loadRoundedNetworkImage(
                  height: 30,
                  width: 30,
                  url: eventDetails.sharedUsers[0].imageUrl,
                )
              : const VisibleGoneContainer(),
          const SizedBox(width: 11.0),
          eventDetails.sharedUsers.length >= 2
              ? loadRoundedNetworkImage(
                  height: 30,
                  width: 30,
                  url: eventDetails.sharedUsers[1].imageUrl,
                )
              : const VisibleGoneContainer(),
          const SizedBox(width: 11.0),
          eventDetails.sharedUsers.length >= 3
              ? loadRoundedNetworkImage(
                  height: 30,
                  width: 30,
                  url: eventDetails.sharedUsers[2].imageUrl,
                )
              : const VisibleGoneContainer(),
          Expanded(child: Container()),
          GestureDetector(
              onTap: () {
                launchShareMenu(eventDetails.toString());
              },
              child: const RoundedActionButton(icon: CupertinoIcons.share))
        ],
      ),
      height: 63.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
        color: const Color(0xfffafafa),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  Widget buildBookNowButton(EventDetailsBlocState uiState) {
    return AnimatedSizeAndFade(
      child: uiState is EventDetailsBlocLoadingState
          ? const VisibleGoneContainer()
          : FloatingActionButton.extended(
              backgroundColor: const Color(0xff232ED1),
              onPressed: () {
                _navigateToCheckoutPage(context, widget.index);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48.0)),
              isExtended: true,
              label: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 16.0),
                child: const Text(
                  "BOOK NOW",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildSecondHeader(String header) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Text(
        header,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildFirstHeader(String header) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Text(
        header,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildAboutText(EventDetails eventDetails) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Text(
        eventDetails.about,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 12.0, color: Color(0xff5a5a5a)),
      ),
    );
  }

  List<Widget> buildEventBySection(EventDetails eventDetails) {
    return [
      buildFirstHeader("Event By"),
      const SizedBox(height: 16.0),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Row(
          children: [
            loadRoundedNetworkImage(
              height: 44.0,
              width: 44.0,
              radius: 50.0,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventDetails.eventBy?.name ?? "Unknown",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Posted on ${convertDateTimeToReadableString(eventDetails.time)}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xffc4c4c4)),
                ),
              ],
            ),
            Expanded(child: Container()),
            GestureDetector(
                onTap: () =>
                    launchCaller(eventDetails.eventBy?.phoneNumber ?? ""),
                child: const RoundedActionButton(icon: CupertinoIcons.phone)),
            const SizedBox(width: 16.0),
            GestureDetector(
                onTap: () {
                  launchMail(eventDetails.eventBy?.email ?? "");
                },
                child: const RoundedActionButton(icon: CupertinoIcons.mail)),
          ],
        ),
      ),
    ];
  }

  Widget buildTopBar(
      Size size, BuildContext context, EventDetails eventDetails) {
    return SizedBox(
      height: size.height * 0.56,
      width: size.width,
      child: Stack(
        children: [
          ClipRRect(
            child: loadNetworkImage(
              url: eventDetails.imageUrl,
              height: size.height * 0.48,
              width: size.width,
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
            ),
          ),
          Container(
            height: size.width * 0.8,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x55000000),
                  Color(0x44000000),
                  Color(0x33000000),
                  Color(0x22000000),
                  Color(0x006564DB),
                  Color(0x006564DB),
                  Color(0x006564DB),
                  Color(0x006564DB),
                ],
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                _navigateBack(context);
              },
              child: const Icon(
                CupertinoIcons.back,
                color: Colors.white,
              ),
            ),
            top: 56,
            left: 8,
          ),
          Positioned(
            child: Icon(
              CupertinoIcons.bookmark,
              color:
                  eventDetails.isSaved ? Colors.white : const Color(0xff232ED1),
            ),
            top: 56,
            right: 8,
          ),
          Positioned(
            top: size.height * 0.42,
            left: 0.0,
            right: 0.0,
            child: buildShortDescCard(eventDetails),
          ),
        ],
      ),
    );
  }

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  Widget buildShortDescCard(EventDetails eventDetails) {
    return Container(
      width: _size.width * 0.90,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _size.width * 0.60,
                child: Text(
                  eventDetails.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              SizedBox(
                width: _size.width * 0.6,
                child: Text(
                  eventDetails.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Color(0xff8D8D8D),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                "Rs. ${eventDetails.price.toString()}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff6564DB),
                ),
              ),
            ],
          ),
          ClipRRect(
            child: Container(
              padding: const EdgeInsets.all(0.4),
              child: loadNetworkImage(
                url: loadRandomImageUrl(),
                height: 50.0,
                width: 50.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            borderRadius: BorderRadius.circular(6.0),
          )
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}

class RoundedActionButton extends StatelessWidget {
  final IconData icon;

  const RoundedActionButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      height: 36.0,
      width: 36.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: const Color(0xff6564DB)),
    );
  }
}
