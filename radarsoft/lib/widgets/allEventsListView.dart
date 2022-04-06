import 'package:flutter/material.dart';
import 'package:radarsoft/eventList/model/eventModel.dart';
import 'package:radarsoft/widgets/cardTile.dart';

class AllEventListView extends StatefulWidget {
  List<Event> obj;
  AllEventListView({Key? key, required this.obj});

  @override
  State<AllEventListView> createState() => _AllEventListViewState();
}

class _AllEventListViewState extends State<AllEventListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSortedList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.obj.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: CardTile(
            islive: getIsLive(widget.obj[index]),
            obj: widget.obj[index],
            isComming: getUpComming(widget.obj[index]),
          ),
        );
      }),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  getSortedList() {
    widget.obj.sort((a, b) {
      var adate = a.eventStartdate!.millisecondsSinceEpoch;
      var bdate = b.eventStartdate!.millisecondsSinceEpoch;
      return bdate.compareTo(
          adate); //to get the order other way just switch `adate & bdate`
    });
  }

  bool getIsLive(Event data) {
    int x = DateTime.now().millisecondsSinceEpoch;
    if (x > data.eventStartdate!.millisecondsSinceEpoch &&
        x < data.eventEnddate!.millisecondsSinceEpoch) {
      return true;
    }
    return false;
  }

  bool getUpComming(Event data) {
    int x = DateTime.now().millisecondsSinceEpoch;
    if (x < data.eventStartdate!.millisecondsSinceEpoch) {
      return true;
    }
    return false;
  }
}
