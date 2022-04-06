import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:radarsoft/constants.dart';
import 'package:radarsoft/eventList/model/eventModel.dart';
import 'package:radarsoft/homeScreen.dart';
import 'package:radarsoft/widgets/live_button.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatelessWidget {
  Event obj;
  bool live, upcoming;
  EventDetails(
      {Key? key, required this.obj, required this.live, required this.upcoming})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Event Details"),
        actions: [
          InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {},
              child: const Icon(
                Icons.qr_code,
                color: Colors.white,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              height: screenHeight(context) / 3.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.7,
                      fit: BoxFit.fill,
                      image: NetworkImage(obj.eventBannerImg2 ?? ""))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      //live button
                      Container(
                          margin: const EdgeInsets.only(left: 260),
                          child: live
                              ? CustomLiveButton()
                              : Container(
                                  alignment: Alignment.center,
                                  height: screenHeight(context) * 0.04,
                                  width: screenWidth(context) / 4.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: upcoming
                                        ? Colors.amber
                                        : Color.fromARGB(255, 232, 85, 0),
                                  ),
                                  child: Text(
                                    upcoming ? "Book Now" : "Attended",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14),
                                  ),
                                )),
                      const SizedBox(
                        height: 70,
                      ),

                      Text(
                        obj.eventName ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth(context) * 0.65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //loremipsum Text
                          Text(
                            obj.eventName ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          //descrition
                          Text(
                            "${DateFormat('yyyy-MM-dd – kk:mm').format(obj.eventCreatedAt ?? DateTime.now())} | ${obj.eventLocation}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    //sahre and twitter icon
                    Row(
                      children: const [
                        //share icon
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        //twitter icon
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.facebook, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //lorem ipsum description
                ExpandableText(
                  obj.eventDescription ?? "",
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 4,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  linkColor: Colors.green,
                ),

                const SizedBox(
                  height: 20,
                ),
                //dashbaord card
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.green)),
                  child: Column(
                    children: [
                      //items
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            dashboardIcon(icon: Icons.alarm, text: 'Agenda'),
                            const VerticalDivider(
                              width: 1,
                              color: Colors.green,
                            ),
                            dashboardIcon(
                                icon: Icons.people, text: 'Attendees'),
                            const VerticalDivider(
                              width: 1,
                              color: Colors.green,
                            ),
                            dashboardIcon(
                                icon: Icons.timeline, text: 'Sponsors'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //items
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            dashboardIcon(icon: Icons.person, text: 'Speakers'),
                            const VerticalDivider(
                              width: 1,
                              color: Colors.green,
                            ),
                            dashboardIcon(icon: Icons.people, text: 'Brands'),
                            const VerticalDivider(
                              width: 1,
                              color: Colors.green,
                            ),
                            dashboardIcon(icon: Icons.timeline, text: 'Videos'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            dashboardIcon(
                                icon: Icons.location_on, text: 'Location'),
                            const VerticalDivider(
                              width: 1,
                              color: Colors.green,
                            ),
                            dashboardIcon(
                                icon: Icons.picture_as_pdf, text: 'Brochures'),
                            const VerticalDivider(
                              width: 1,
                              color: Colors.green,
                            ),
                            dashboardIcon(
                                icon: Icons.unfold_more, text: 'More'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //button
                InkWell(
                  onTap: () {
                    showSnackbar(context, "Check In Pressed");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: screenHeight(context) * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "Check In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  ///dashboard icon use in Card
  Widget dashboardIcon({required IconData icon, required String text}) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Column(children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 34,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        )
      ]),
    );
  }
}
