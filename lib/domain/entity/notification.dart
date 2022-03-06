import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

@freezed
class NotificationItem with _$NotificationItem {
  factory NotificationItem({
    @Default("") String id,
    @Default("") String imageUrl,
    @Default("Unknown") String title,
    @Default("Unknown") String time,
    @Default(false) bool isRead,
  }) = _NotificationItem;
}
