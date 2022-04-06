import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radarsoft/constants.dart';
import 'package:radarsoft/eventList/model/eventModel.dart';
import 'package:radarsoft/event_details.dart';
import 'package:radarsoft/widgets/allEventsListView.dart';
import 'package:radarsoft/widgets/cardTile.dart';
import 'package:radarsoft/widgets/live_button.dart';
import 'package:radarsoft/widgets/slider.dart';

import 'eventList/viewModel/eventViewModel.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    EventViewModel eventViewModel = context.watch<EventViewModel>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_rounded)),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: red,
                  ),
                  child: const Text(
                    "0",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                size: 35,
              )),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: Container(
          child: _ui(eventViewModel),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      showSnackbar(context, "Press Back Once Again to Exit");
      return false;
    } else {
      return true;
    }
  }

  _ui(EventViewModel eventViewModel) {
    if (eventViewModel.isloading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (eventViewModel.eventListModel.isEmpty) {
      return Center(
        child: Text("No data available"),
      );
    }

    return Consumer<EventViewModel>(builder: (context, value, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: screenHeight(context) / 2.5,
                  color: green,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      EventSlider(
                        list: value.liveEventListModel,
                        title: "Live",
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      EventSlider(
                        list: value.upcomingEventListModel,
                        title: "Upcomming",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (value.pastEventListModel.isNotEmpty)
                        Text(
                          'Past Events',
                          style: TextStyle(
                              color: green,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      AllEventListView(obj: value.pastEventListModel),
                      const SizedBox(
                        height: 10,
                      ),
                      //card
                      if (value.allEventListModel.isNotEmpty)
                        Text(
                          'All Events',
                          style: TextStyle(
                              color: green,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      AllEventListView(obj: value.allEventListModel),

                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
