import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:radarsoft/eventList/model/eventModel.dart';

import '../services/eventService.dart';

class EventViewModel with ChangeNotifier {
  bool _isloading = false;
  List<AllEventModel> _eventListModel = [];
  List<Event> _liveEventListModel = [];
  List<Event> _upcomingEventListModel = [];
  List<Event> _pastEventListModel = [];
  List<Event> _allEventListModel = [];

  bool get isloading => _isloading;
  List<AllEventModel> get eventListModel => _eventListModel;
  List<Event> get liveEventListModel => _liveEventListModel;
  List<Event> get upcomingEventListModel => _upcomingEventListModel;
  List<Event> get pastEventListModel => _pastEventListModel;
  List<Event> get allEventListModel => _allEventListModel;
  EventViewModel() {
    getEve();
  }

  setLoading(bool loading) {
    _isloading = loading;
    notifyListeners();
  }

  setEventListModel(List<AllEventModel> allEventsListModel) {
    _eventListModel = allEventsListModel.toList();
    _liveEventListModel = _eventListModel[0].liveevents!.toList();
    _upcomingEventListModel = _eventListModel[0].upcomigevents!.toList();
    _pastEventListModel = _eventListModel[0].mypastvent!.toList();
    _allEventListModel = _eventListModel[0].allevents!.toList();
  }

  getEve() async {
    setLoading(true);
    var response = await EventServices.getEvents();

    if (response != null) {
      List<AllEventModel> d = [];
      d.add(response);
      setEventListModel(d);
    }
    setLoading(false);
  }
}
