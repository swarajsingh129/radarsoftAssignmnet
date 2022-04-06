import 'package:flutter/material.dart';
import 'package:radarsoft/constants.dart';
import 'package:radarsoft/eventList/model/eventModel.dart';
import 'package:radarsoft/event_details.dart';
import 'package:radarsoft/widgets/live_button.dart';
import 'package:intl/intl.dart';

class CardTile extends StatefulWidget {
  Event obj;
  bool islive;
  bool isComming;
  CardTile({
    required this.obj,
    required this.islive,
    required this.isComming,
    Key? key,
  }) : super(key: key);

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
        // padding: const EdgeInsets.all(8),
        child: widget.islive
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  detailCard(
                      context: context,
                      titeltext: widget.obj.eventName ?? "",
                      date: DateFormat('yyyy-MM-dd – kk:mm')
                          .format(widget.obj.eventStartdate ?? DateTime.now()),
                      btnText: "Join Now",
                      btnColor: green,
                      isAttend: false,
                      ontap: () {
                        navigate(
                            context,
                            EventDetails(
                              obj: widget.obj,
                              live: widget.islive,
                              upcoming: false,
                            ));
                      }),
                  imageCard(
                      image: widget.obj.eventBannerImg1 ?? "",
                      context: context,
                      isLive: widget.islive),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageCard(
                      image: widget.obj.eventBannerImg1 ?? "",
                      context: context,
                      isLive: widget.islive),
                  detailCard(
                      context: context,
                      titeltext: widget.obj.eventName ?? "",
                      date: DateFormat('yyyy-MM-dd – kk:mm')
                          .format(widget.obj.eventStartdate ?? DateTime.now()),
                      btnText:
                          widget.isComming ? "Book Now" : "View - Take - Aways",
                      btnColor: widget.isComming ? yellow : orange,
                      isAttend: widget.isComming ? false : true,
                      ontap: () {
                        navigate(
                            context,
                            EventDetails(
                              obj: widget.obj,
                              live: false,
                              upcoming: widget.isComming,
                            ));
                      }),
                ],
              ),
      ),
    );
  }

  Expanded detailCard(
      {required BuildContext context,
      required String titeltext,
      required String date,
      required String btnText,
      required bool isAttend,
      required VoidCallback ontap,
      required Color btnColor}) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titeltext,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              date,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
            const SizedBox(
              height: 5,
            ),
            isAttend == false
                ? Text(
                    "",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  )
                : Row(
                    children: const [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      Text(
                        'Attended on',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
            InkWell(
              onTap: ontap,
              child: Container(
                alignment: Alignment.center,
                // width: screenWidth(context) / 4,
                height: screenHeight(context) * 0.04,
                decoration: BoxDecoration(
                    color: btnColor, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  btnText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded imageCard(
      {required BuildContext context,
      required String image,
      required bool isLive}) {
    return Expanded(
      flex: 1,
      child: Stack(clipBehavior: Clip.none, children: [
        ClipRRect(
          // borderRadius: const BorderRadius.only(
          //     topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          child: Container(
            // margin: const EdgeInsets.only(left: 60),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.8,
                  image: NetworkImage(
                    image,
                  )),
            ),
            width: double.infinity,
            height: screenHeight(context) * 0.21,
          ),
        ),
        isLive == true
            ? const Positioned(top: 10, right: 10, child: CustomLiveButton())
            : SizedBox(),
      ]),
    );
  }
}
