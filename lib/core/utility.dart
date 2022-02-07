import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
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

Duration loadRandomDuration() {
  final random = Random();
  final randomTimeMs = random.nextInt(1800);
  return Duration(milliseconds: randomTimeMs);
}
