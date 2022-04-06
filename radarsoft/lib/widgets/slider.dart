import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:radarsoft/eventList/model/eventModel.dart';
import 'package:radarsoft/event_details.dart';
import 'package:radarsoft/widgets/cardTile.dart';

import '../constants.dart';

class EventSlider extends StatefulWidget {
  List<Event> list;
  String title;
  EventSlider({Key? key, required this.list, required this.title});

  @override
  State<EventSlider> createState() => _EventSliderState();
}

class _EventSliderState extends State<EventSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imgSlider = getEventSlider(widget.list);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.title} Events',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: CarouselSlider(
            items: imgSlider,
            carouselController: _controller,
            options: CarouselOptions(
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.22,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.list.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<Widget> getEventSlider(List<Event> list) {
    if (widget.title == "Live") {
      return list
          .map((Event item) => CardTile(
                obj: item,
                islive: true,
                isComming: false,
              ))
          .toList();
    } else {
      return list
          .map((Event item) => Container(
                margin: const EdgeInsets.all(5.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Image.network(
                      item.eventBannerImg1 ?? "",
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //banner heading
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              // item.bannerheading!,
                              item.eventName ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),

                          const Spacer(),
                          InkWell(
                            onTap: () {
                              navigate(
                                  context,
                                  EventDetails(
                                    obj: item,
                                    live: false,
                                    upcoming: true,
                                  ));
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(bottom: 20, right: 160),
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: screenHeight(context) * 0.04,
                              width: screenWidth(context) / 4.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.amber,
                              ),
                              child: const Text(
                                "Book Now",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
          .toList();
    }
  }
}
