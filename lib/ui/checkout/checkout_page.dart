import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecassion/data/data_sources/category_local_data_source.dart';
import 'package:ecassion/domain/entity/event_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final int index;

  const CheckoutPage({Key? key, required this.index}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    EventDetails _eventDetails = EventDetails();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: _size.width,
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            height: _size.height * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black87.withOpacity(0.2)),
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    loadRandomImageUrl(),
                    maxWidth: _size.width.toInt(),
                    maxHeight: (_size.height * 0.3).toInt(),
                  )),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ],
      ),
    );
  }
}
