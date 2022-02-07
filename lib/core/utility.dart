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
    return hour.toString() +
        ":" +
        time.minute.toString() +
        " " +
        meridiem;
  }
}
