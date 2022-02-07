import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(),
              const SizedBox(height: 31.0),
              const Text(
                "Trending Events near you",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 11.0),
              buildTrendingPlaceList(),
              const SizedBox(height: 25.0),
              const Text(
                "Category",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 11.0),
              buildCategoriesList()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildTrendingPlaceList() {
    return SizedBox(
      height: 199.0,
      child: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildTrendingEventCard(context, index);
        },
      ),
    );
  }

  SizedBox buildCategoriesList() {
    return SizedBox(
      height: 88.0,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildCategoryCard(context, index);
        },
      ),
    );
  }

  Container buildCategoryCard(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 88.0,
      height: 88.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Stack(children: [
          Image.network(
            "https://i.pinimg.com/originals/f5/a5/cf/f5a5cf3ea8a23ab4eac12925b0ccc075.jpg",
            fit: BoxFit.fill,
            height: 88,
            width: 88,
          )
        ]),
      ),
    );
  }

  Container buildTrendingEventCard(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 312.0,
      height: 199.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Stack(children: [
          Image.network(
            "https://i.pinimg.com/originals/f5/a5/cf/f5a5cf3ea8a23ab4eac12925b0ccc075.jpg",
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
                      children: const [
                        Text(
                          "Laugh with Vir Das / 20.12.2021",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "10:30 PM, 10040 Shirley School Rd Potosi, Missouri(MO), 63664",
                          style: TextStyle(
                              fontSize: 10.0, color: Color(0xff8D8D8D)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    "Rs " + (1000 * index).toString(),
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
                width: 56.0,
                height: 26.0,
                child: const Center(
                  child: Text(
                    "Top",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }

  Row buildAppBar() {
    Row appBar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("images/splash_logo.svg", height: 30, width: 30),
        ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              "https://media.istockphoto.com/vectors/man-avatar-icon-man-flat-icon-man-faceless-avatar-man-character-vector-id1027705716?k=6&m=1027705716&s=170667a&w=0&h=aTAhPe2CvnQGIbI25T_d7XNZwNyumn5Xe1fOMfhELx4=",
              height: 30,
              width: 30,
            ))
      ],
    );
    return appBar;
  }
}
