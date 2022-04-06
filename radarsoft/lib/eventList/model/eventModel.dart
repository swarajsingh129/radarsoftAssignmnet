import 'dart:convert';

AllEventModel allEventModelFromJson(String str) =>
    AllEventModel.fromJson(json.decode(str));

String allEventModelToJson(AllEventModel data) => json.encode(data.toJson());

class AllEventModel {
  String? status;
  String? message;
  List<Event>? allevents;
  List<Event>? liveevents;
  List<Event>? upcomigevents;
  List<Event>? mypastvent;

  AllEventModel({
    this.status,
    this.message,
    this.allevents,
    this.liveevents,
    this.upcomigevents,
    this.mypastvent,
  });

  factory AllEventModel.fromJson(Map<String, dynamic> json) => AllEventModel(
        status: json["status"],
        message: json["message"],
        allevents:
            List<Event>.from(json["allevents"].map((x) => Event.fromJson(x))),
        liveevents:
            List<Event>.from(json["liveevents"].map((x) => Event.fromJson(x))),
        upcomigevents: List<Event>.from(
            json["upcomigevents"].map((x) => Event.fromJson(x))),
        mypastvent:
            List<Event>.from(json["mypastvent"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "allevents": List<dynamic>.from(allevents!.map((x) => x.toJson())),
        "liveevents": List<dynamic>.from(liveevents!.map((x) => x.toJson())),
        "upcomigevents":
            List<dynamic>.from(upcomigevents!.map((x) => x.toJson())),
        "mypastvent": List<dynamic>.from(mypastvent!.map((x) => x)),
      };
}

class Event {
  Event({
    this.eventId,
    this.eventName,
    this.eventCategoryId,
    this.eventOrganizerId,
    this.eventDescription,
    this.eventStartdate,
    this.eventEnddate,
    this.eventStarttime,
    this.eventEndtime,
    this.eventBanneroneimg,
    this.eventType,
    this.eventAmount,
    this.eventCode,
    this.eventBannertwoimg,
    this.eventQrcode,
    this.eventLocation,
    this.eventTwitter,
    this.eventFacebook,
    this.eventLinkedin,
    this.eventInstragram,
    this.eventYoutube,
    this.eventSkype,
    this.eventWechat,
    this.eventStatus,
    this.eventCreatedAt,
    this.categoryId,
    this.categoryOrganizerId,
    this.categoryFor,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatedAt,
    this.rating,
    this.isCheckin,
    this.isAgenda,
    this.isSpeaker,
    this.isBooking,
    this.isRates,
    this.eventBannerImg1,
    this.eventBannerImg2,
    this.eventExhibitorId,
    this.categoryExhibitorId,
  });

  int? eventId;
  String? eventName;
  int? eventCategoryId;
  int? eventOrganizerId;
  String? eventDescription;
  DateTime? eventStartdate;
  DateTime? eventEnddate;
  EventStarttime? eventStarttime;
  String? eventEndtime;
  String? eventBanneroneimg;
  EventType? eventType;
  String? eventAmount;
  String? eventCode;
  String? eventBannertwoimg;
  String? eventQrcode;
  String? eventLocation;
  dynamic eventTwitter;
  dynamic eventFacebook;
  dynamic eventLinkedin;
  dynamic eventInstragram;
  dynamic eventYoutube;
  dynamic eventSkype;
  dynamic eventWechat;
  int? eventStatus;
  DateTime? eventCreatedAt;
  int? categoryId;
  int? categoryOrganizerId;
  int? categoryFor;
  CategoryName? categoryName;
  CategoryImage? categoryImage;
  int? categoryStatus;
  DateTime? categoryCreatedAt;
  int? rating;
  Is? isCheckin;
  Is? isAgenda;
  Is? isSpeaker;
  Is? isBooking;
  Is? isRates;
  String? eventBannerImg1;
  String? eventBannerImg2;
  dynamic eventExhibitorId;
  dynamic categoryExhibitorId;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        eventId: json["eventId"],
        eventName: json["eventName"],
        eventCategoryId: json["eventCategory_id"],
        eventOrganizerId: json["eventOrganizer_id"] == null
            ? null
            : json["eventOrganizer_id"],
        eventDescription: json["eventDescription"],
        eventStartdate: DateTime.parse(json["eventStartdate"]),
        eventEnddate: DateTime.parse(json["eventEnddate"]),
        eventStarttime: eventStarttimeValues.map[json["eventStarttime"]],
        eventEndtime: json["eventEndtime"],
        eventBanneroneimg: json["eventBanneroneimg"],
        eventType: eventTypeValues.map[json["eventType"]],
        eventAmount: json["eventAmount"] == null ? null : json["eventAmount"],
        eventCode: json["eventCode"],
        eventBannertwoimg: json["eventBannertwoimg"],
        eventQrcode: json["eventQrcode"],
        eventLocation: json["eventLocation"],
        eventTwitter: json["eventTwitter"],
        eventFacebook: json["eventFacebook"],
        eventLinkedin: json["eventLinkedin"],
        eventInstragram: json["eventInstragram"],
        eventYoutube: json["eventYoutube"],
        eventSkype: json["eventSkype"],
        eventWechat: json["eventWechat"],
        eventStatus: json["eventStatus"],
        eventCreatedAt: DateTime.parse(json["eventCreated_at"]),
        categoryId: json["categoryId"],
        categoryOrganizerId: json["categoryOrganizer_id"] == null
            ? null
            : json["categoryOrganizer_id"],
        categoryFor: json["categoryFor"],
        categoryName: categoryNameValues.map[json["categoryName"]],
        categoryImage: categoryImageValues.map[json["categoryImage"]],
        categoryStatus: json["categoryStatus"],
        categoryCreatedAt: DateTime.parse(json["categoryCreated_at"]),
        rating: json["Rating"],
        isCheckin: isValues.map[json["isCheckin"]],
        isAgenda: isValues.map[json["isAgenda"]],
        isSpeaker: isValues.map[json["isSpeaker"]],
        isBooking: isValues.map[json["isBooking"]],
        isRates: isValues.map[json["isRates"]],
        eventBannerImg1: json["event_banner_img1"],
        eventBannerImg2: json["event_banner_img2"],
        eventExhibitorId: json["eventExhibitor_id"],
        categoryExhibitorId: json["categoryExhibitor_id"],
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "eventCategory_id": eventCategoryId,
        "eventOrganizer_id": eventOrganizerId == null ? null : eventOrganizerId,
        "eventDescription": eventDescription,
        "eventStartdate":
            "${eventStartdate!.year.toString().padLeft(4, '0')}-${eventStartdate!.month.toString().padLeft(2, '0')}-${eventStartdate!.day.toString().padLeft(2, '0')}",
        "eventEnddate":
            "${eventEnddate!.year.toString().padLeft(4, '0')}-${eventEnddate!.month.toString().padLeft(2, '0')}-${eventEnddate!.day.toString().padLeft(2, '0')}",
        "eventStarttime": eventStarttimeValues.reverse[eventStarttime],
        "eventEndtime": eventEndtime,
        "eventBanneroneimg": eventBanneroneimg,
        "eventType": eventTypeValues.reverse[eventType],
        "eventAmount": eventAmount == null ? null : eventAmount,
        "eventCode": eventCode,
        "eventBannertwoimg": eventBannertwoimg,
        "eventQrcode": eventQrcode,
        "eventLocation": eventLocation,
        "eventTwitter": eventTwitter,
        "eventFacebook": eventFacebook,
        "eventLinkedin": eventLinkedin,
        "eventInstragram": eventInstragram,
        "eventYoutube": eventYoutube,
        "eventSkype": eventSkype,
        "eventWechat": eventWechat,
        "eventStatus": eventStatus,
        "eventCreated_at": eventCreatedAt!.toIso8601String(),
        "categoryId": categoryId,
        "categoryOrganizer_id":
            categoryOrganizerId == null ? null : categoryOrganizerId,
        "categoryFor": categoryFor,
        "categoryName": categoryNameValues.reverse[categoryName],
        "categoryImage": categoryImageValues.reverse[categoryImage],
        "categoryStatus": categoryStatus,
        "categoryCreated_at": categoryCreatedAt!.toIso8601String(),
        "Rating": rating,
        "isCheckin": isValues.reverse[isCheckin],
        "isAgenda": isValues.reverse[isAgenda],
        "isSpeaker": isValues.reverse[isSpeaker],
        "isBooking": isValues.reverse[isBooking],
        "isRates": isValues.reverse[isRates],
        "event_banner_img1": eventBannerImg1,
        "event_banner_img2": eventBannerImg2,
        "eventExhibitor_id": eventExhibitorId,
        "categoryExhibitor_id": categoryExhibitorId,
      };
}

enum CategoryImage { THE_1648787609_JPG }

final categoryImageValues =
    EnumValues({"1648787609.jpg": CategoryImage.THE_1648787609_JPG});

enum CategoryName { TEST }

final categoryNameValues = EnumValues({"test": CategoryName.TEST});

enum EventStarttime { THE_1300, THE_1400, THE_0800 }

final eventStarttimeValues = EnumValues({
  "08:00": EventStarttime.THE_0800,
  "13:00": EventStarttime.THE_1300,
  "14:00": EventStarttime.THE_1400
});

enum EventType { FREE, PAID }

final eventTypeValues =
    EnumValues({"free": EventType.FREE, "paid": EventType.PAID});

enum Is { YES, NO }

final isValues = EnumValues({"No": Is.NO, "Yes": Is.YES});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
