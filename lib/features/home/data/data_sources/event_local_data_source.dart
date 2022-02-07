import 'package:ecassion/features/home/data/dto/event_dto.dart';

class EventLocalDataSource {
  Future<List<EventDto>> getTrendingEvents() async {
    await Future.delayed(const Duration(seconds:4));
    return [
      EventDto(
        name: "BNP Paribas World Team Cup",
        imageUrl:
            "https://www.paralympic.org/sites/default/files/images/150619101825360_Ariake%2BColosseum_0.jpg",
        price: 2000,
        time: DateTime.now(),
        address: "University Blvd, Nottingham NG7 2QH, UK",
        isSaved: false,
        isTop: true,
      ),
      EventDto(
        name: "Viking Open Nottingham",
        imageUrl:
            "https://www.atptour.com/-/media/images/news/2021/06/08/02/38/nottingham-2021-venue2.jpg",
        price: 100,
        time: DateTime.now(),
        address: "Roland-Rainer-Platz 1, 1150 Wien, Austria",
        isSaved: true,
        isTop: false,
      ),
      EventDto(
        name: "Viking Open Nottingham",
        imageUrl:
            "https://www.atptour.com/-/media/images/news/2021/06/08/02/38/nottingham-2021-venue2.jpg",
        price: 100,
        address: "University Blvd, Nottingham NG7 2QH, UK",
        isSaved: true,
        time: DateTime.now(),
        isTop: true,
      ),
      EventDto(
        name: "cinch Championships",
        imageUrl:
            "https://artwork.espncdn.com/airings/9c295bee-b00a-436b-951b-54c47cf035b2/16x9/original_20210615162454.jpg",
        price: 800,
        address: "Palliser Rd, London W14 9EQ, UK",
        isSaved: true,
        time: DateTime.now(),
        isTop: true,
      ),
      EventDto(
        name: "Nottingham Trophy",
        imageUrl:
            "https://i.dailymail.co.uk/i/pix/2014/09/14/1410700830401_wps_18_NOTTINGHAM_ENGLAND_SEPTEM.jpg",
        price: 1500,
        address:
            "4 Wilford Ln, West Bridgford, Nottingham NG2 7QX, United Kingdom",
        isSaved: false,
        isTop: false,
      )
    ];
  }

  Future<List<EventDto>> getUpcomingEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      EventDto(
        name: "BNP Paribas World Team Cup",
        imageUrl:
            "https://www.paralympic.org/sites/default/files/images/150619101825360_Ariake%2BColosseum_0.jpg",
        price: 2000,
        time: DateTime.now(),
        address: "University Blvd, Nottingham NG7 2QH, UK",
        isSaved: false,
        isTop: true,
      ),
      EventDto(
        name: "Viking Open Nottingham",
        imageUrl:
            "https://www.atptour.com/-/media/images/news/2021/06/08/02/38/nottingham-2021-venue2.jpg",
        price: 100,
        time: DateTime.now(),
        address: "Roland-Rainer-Platz 1, 1150 Wien, Austria",
        isSaved: true,
        isTop: false,
      ),
      EventDto(
        name: "Viking Open Nottingham",
        imageUrl:
            "https://www.atptour.com/-/media/images/news/2021/06/08/02/38/nottingham-2021-venue2.jpg",
        price: 100,
        address: "University Blvd, Nottingham NG7 2QH, UK",
        isSaved: true,
        time: DateTime.now(),
        isTop: true,
      ),
      EventDto(
        name: "cinch Championships",
        imageUrl:
            "https://artwork.espncdn.com/airings/9c295bee-b00a-436b-951b-54c47cf035b2/16x9/original_20210615162454.jpg",
        price: 800,
        address: "Palliser Rd, London W14 9EQ, UK",
        isSaved: true,
        time: DateTime.now(),
        isTop: true,
      ),
      EventDto(
        name: "Nottingham Trophy",
        imageUrl:
            "https://i.dailymail.co.uk/i/pix/2014/09/14/1410700830401_wps_18_NOTTINGHAM_ENGLAND_SEPTEM.jpg",
        price: 1500,
        address:
            "4 Wilford Ln, West Bridgford, Nottingham NG2 7QX, United Kingdom",
        isSaved: false,
        isTop: false,
      )
    ];
  }
}
