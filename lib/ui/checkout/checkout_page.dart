import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecassion/ui/checkout/bloc/checkout_page_bloc_event.dart';
import 'package:ecassion/ui/checkout/bloc/checkout_page_bloc_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/checkout_page_bloc.dart';

class CheckoutPage extends StatefulWidget {
  final int index;

  const CheckoutPage({Key? key, required this.index}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late CheckoutPageBloc _checkoutPageBloc;

  @override
  void initState() {
    _checkoutPageBloc = CheckoutPageBloc(CheckoutPageBlocLoadingState());
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
    if (!_checkoutPageBloc.isClosed) {
      _checkoutPageBloc.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

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
      body: BlocProvider(
        create: (context) =>
            _checkoutPageBloc..add(CheckoutPageInitialLoadEvent(widget.index)),
        child: BlocBuilder<CheckoutPageBloc, CheckoutPageBlocState>(
          builder: (context, state) {
            if (state is CheckoutPageBlocSuccessState) {
              return Column(
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
                          decoration: BoxDecoration(
                            color: Colors.black87.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          state.uiState.eventDetails.imageUrl,
                          maxWidth: _size.width.toInt(),
                          maxHeight: (_size.height * 0.3).toInt(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ],
              );
            } else if (state is CheckoutPageBlocErrorState) {
              return const Center(child: Icon(CupertinoIcons.globe));
            } else {
              return const Center(child: CupertinoActivityIndicator());
            }
          },
        ),
      ),
    );
  }
}
