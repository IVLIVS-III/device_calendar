part of device_calendar;

class Event {
  String eventId;
  String calendarId;
  String title;
  String description;

  DateTime start;
  DateTime end;

  bool allDay;
  Location location;

  List<Attendee> attendees;

  Event(this.calendarId, {this.title, this.start, this.end});

  Event.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw new ArgumentError(Constants.fromJsonMapIsNull);
    }

    eventId = json['eventId'];
    calendarId = json['calendarId'];
    title = json['title'];
    description = json['description'];
    int startMillisecondsSinceEpoch = json['start'];
    if (startMillisecondsSinceEpoch != null) {
      start =
          new DateTime.fromMillisecondsSinceEpoch(startMillisecondsSinceEpoch);
    }
    int endMillisecondsSinceEpoch = json['end'];
    if (endMillisecondsSinceEpoch != null) {
      end = new DateTime.fromMillisecondsSinceEpoch(endMillisecondsSinceEpoch);
    }
    allDay = json['allDay'];
    if (json['location'] != null) {
      location = new Location.fromJson(json['location']);
    }
    if (json['attendees'] != null) {
      attendees = json['attendees'].map<Attendee>((decodedAttendee) {
        return new Attendee.fromJson(decodedAttendee);
      }).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventId'] = this.eventId;
    data['calendarId'] = this.calendarId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['start'] = this.start.millisecondsSinceEpoch;
    data['end'] = this.end.millisecondsSinceEpoch;
    data['allDay'] = this.allDay;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (attendees != null) {
      List<Map<String, dynamic>> attendeesJson = new List();
      for (var attendee in attendees) {
        var attendeeJson = attendee.toJson();
        attendeesJson.add(attendeeJson);
      }
      data['attendees'] = attendeesJson;
    }
    return data;
  }
}
