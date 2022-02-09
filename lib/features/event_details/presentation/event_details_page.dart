import 'package:ecassion/core/utility.dart';
import 'package:ecassion/features/home/data/data_sources/category_local_data_source.dart';
import 'package:ecassion/features/search/domain/entity/event.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late Size _size;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _size = size;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildBookNowButton(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopBar(size, context),
            buildEventBySection()[0],
            buildEventBySection()[1],
            buildEventBySection()[2],
            const SizedBox(height: 25.0),
            buildSecondHeader("About"),
            const SizedBox(height: 11.0),
            buildAboutText(),
            const SizedBox(height: 11.0),
            buildShareCard(),
            const SizedBox(height: 11.0),
            buildFirstHeader("Recommendations"),
            SizedBox(
              height: size.height,
              child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 11.0,
                    mainAxisSpacing: 11.0,
                  ),
                  itemBuilder: (context, index) {
                    final event = Event(
                      name: faker.sport.name() + " World Team Cup",
                      imageUrl:
                          randomImageUrl[random.integer(randomImageUrl.length)],
                      price: random.integer(10000),
                      time: faker.date.dateTime(),
                      address: faker.address.city(),
                      isSaved: random.boolean(),
                      isTop: random.boolean(),
                    );
                    return buildUpcomingEventCard(context, event);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUpcomingEventCard(BuildContext context, Event event) {
    return GestureDetector(
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
              Expanded(
                child: loadNetworkImage(
                  url: event.imageUrl,
                  fit: BoxFit.cover,
                  height: _size.height * 0.29465021,
                  width: _size.width / 2.1,
                ),
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

  Container buildShareCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: [
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(2.0),
            child: const Icon(
              CupertinoIcons.share,
              color: Colors.white,
            ),
            height: 36.0,
            width: 36.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color(0xff6564DB),
            ),
          ),
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

  FloatingActionButton buildBookNowButton() {
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xff232ED1),
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.0)),
      isExtended: true,
      label: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
        child: const Text(
          "BOOK NOW",
          style: TextStyle(
            fontSize: 16.0,
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
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildAboutText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      child: const Text(
        "Tame Impala is the psychedelic music project of Australian"
        "multi-instrumentalist Kevin Parker. In the recording studio,"
        "Parker writes, records, performs, and produces all of the"
        "project's music.",
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 12.0, color: Color(0xff5a5a5a)),
      ),
    );
  }

  List<Widget> buildEventBySection() {
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
              children: const [
                Text(
                  "Naimul Kabir",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Posted on 30 Jan, 2021",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Color(0xffc4c4c4)),
                ),
              ],
            ),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.all(2.0),
              child: const Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              height: 36.0,
              width: 36.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: const Color(0xff6564DB)),
            ),
            const SizedBox(width: 16.0),
            Container(
              padding: const EdgeInsets.all(2.0),
              child: const Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              height: 36.0,
              width: 36.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: const Color(0xff6564DB)),
            ),
          ],
        ),
      ),
    ];
  }

  Widget buildTopBar(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * 0.56,
      width: size.width,
      child: Stack(
        children: [
          ClipRRect(
            child: loadNetworkImage(
              url: "https://cdn.wallpapersafari.com/10/68/gw6JbD.jpg",
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
          const Positioned(
            child: Icon(
              CupertinoIcons.bookmark,
              color: Colors.white,
            ),
            top: 56,
            right: 8,
          ),
          Positioned(
            top: size.height * 0.42,
            left: 0.0,
            right: 0.0,
            child: buildShortDescCard(),
          ),
        ],
      ),
    );
  }

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  Widget buildShortDescCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Tame Impala",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                "Tame Impala",
                style: TextStyle(
                  fontSize: 10.0,
                  color: Color(0xff8D8D8D),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                "Rs. 2000",
                style: TextStyle(
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
      height: 100.0,
      width: 300.0,
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
