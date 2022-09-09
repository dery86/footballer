import 'package:footballer/domain/entities/remote/fixtures/periods.dart';
import 'package:footballer/domain/entities/remote/fixtures/status.dart';
import 'package:footballer/domain/entities/remote/fixtures/venue.dart';

class Fixture{
  int? id;
  String? referee;
  String? timezone;
  String? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  Fixture(
      {this.id,
        this.referee,
        this.timezone,
        this.date,
        this.timestamp,
        this.periods,
        this.venue,
        this.status});

  Fixture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    periods =
    json['periods'] != null ? new Periods.fromJson(json['periods']) : null;
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['referee'] = referee;
    data['timezone'] = timezone;
    data['date'] = date;
    data['timestamp'] = timestamp;
    if (periods != null) {
      data['periods'] = periods!.toJson();
    }
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}