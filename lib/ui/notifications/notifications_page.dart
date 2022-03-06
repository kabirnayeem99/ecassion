import 'package:ecassion/data/data_sources/notification_local_data_source.dart';
import 'package:ecassion/domain/entity/notification.dart';
import 'package:flutter/material.dart';

import '../../core/utility.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<NotificationItem> notifications = [];

  @override
  void initState() {
    NotificationLocalDataSource()
        .getAllNotifications()
        .then((value) => setState(() {
              notifications = value;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, position) {
            final notification = notifications[position];
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: ListTile(
                leading: loadRoundedNetworkImage(
                  url: notification.imageUrl,
                  height: 42.0,
                  width: 42.0,
                  radius: 8.0,
                ),
                title: Text(notification.title),
                subtitle: Text(notification.time),
              ),
            );
          },
        ),
      ),
    );
  }
}
