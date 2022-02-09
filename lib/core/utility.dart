import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';

String convertDateTimeToReadableString(DateTime? time) {
  if (time == null) {
    return "";
  } else {
    var meridiem = "AM";
    var hour = 0;
    if (time.hour > 12) {
      meridiem = "PM";
      hour = time.hour - 12;
    } else {
      meridiem = "AM";
    }
    return hour.toString() + ":" + time.minute.toString() + " " + meridiem;
  }
}

Widget loadNetworkImage({
  String url = "https://picsum.photos/id/237/200/300",
  double height = 0.0,
  double width = 0.0,
  BoxFit fit = BoxFit.fill,
}) {
  return CachedNetworkImage(
    fit: fit,
    height: height,
    width: width,
    imageUrl: url,
    placeholder: (context, url) => const CupertinoActivityIndicator(),
    errorWidget: (context, url, error) => const Icon(CupertinoIcons.photo_fill),
  );
}

Widget loadRoundedNetworkImage({
  String url = "https://picsum.photos/id/237/200/300",
  double height = 0.0,
  double width = 0.0,
  BoxFit fit = BoxFit.fill,
  double radius = 12.0,
}) {
  return ClipRRect(
    child: loadNetworkImage(url: url, height: height, width: width, fit: fit),
    borderRadius: BorderRadius.circular(radius),
  );
}

Duration loadRandomDuration() {
  final randomTimeMs = random.integer(1000);
  return Duration(milliseconds: randomTimeMs);
}
