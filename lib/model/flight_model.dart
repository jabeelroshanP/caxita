 class FlightTripModel {
  final String flightTripKey;
  final FareDetails fareDetails;
  final List<FlightJourney> flightJourneys;

  FlightTripModel({
    required this.flightTripKey,
    required this.fareDetails,
    required this.flightJourneys,
  });

  factory FlightTripModel.fromJson(Map<String, dynamic> json) {
    return FlightTripModel(
      flightTripKey: json['FlightTripKey'],
      fareDetails: FareDetails.fromJson(json['FareDetails']),
      flightJourneys: (json['FlightJourneys'] as List)
          .map((e) => FlightJourney.fromJson(e))
          .toList(),
    );
  }
}
 class FareDetails {
  final String currency;
  final double total;

  FareDetails({
    required this.currency,
    required this.total,
  });

  factory FareDetails.fromJson(Map<String, dynamic> json) {
    return FareDetails(
      currency: json['Currency'],
      total: double.parse(json['Total']),
    );
  }
}
 class FlightJourney {
  final JourneyTime journeyTime;
  final int totalStops;
  final List<FlightItem> flightItems;

  FlightJourney({
    required this.journeyTime,
    required this.totalStops,
    required this.flightItems,
  });

  factory FlightJourney.fromJson(Map<String, dynamic> json) {
    return FlightJourney(
      journeyTime: JourneyTime.fromJson(json['JourneyTime']),
      totalStops: json['TotalStops'],
      flightItems: (json['FlightItems'] as List)
          .map((e) => FlightItem.fromJson(e))
          .toList(),
    );
  }
}
 class JourneyTime {
  final int hours;
  final int minutes;

  JourneyTime({
    required this.hours,
    required this.minutes,
  });

  factory JourneyTime.fromJson(Map<String, dynamic> json) {
    return JourneyTime(
      hours: json['Hours'],
      minutes: json['Minutes'],
    );
  }
}
 class FlightItem {
  final Location departure;
  final Location arrival;
  final FlightInfo flightInfo;

  FlightItem({
    required this.departure,
    required this.arrival,
    required this.flightInfo,
  });

  factory FlightItem.fromJson(Map<String, dynamic> json) {
    return FlightItem(
      departure: Location.fromJson(json['Departure']),
      arrival: Location.fromJson(json['Arrival']),
      flightInfo: FlightInfo.fromJson(json['FlightInfo']),
    );
  }
}
 class Location {
  final String cityName;
  final String airportCode;
  final String dateTime;

  Location({
    required this.cityName,
    required this.airportCode,
    required this.dateTime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      cityName: json['CityName']['en'],
      airportCode: json['AirportCode'],
      dateTime: json['DateTime'],
    );
  }
}
 class FlightInfo {
  final String name;
  final String code;
  final String number;

  FlightInfo({
    required this.name,
    required this.code,
    required this.number,
  });

  factory FlightInfo.fromJson(Map<String, dynamic> json) {
    return FlightInfo(
      name: json['Name']['en'],
      code: json['Code'],
      number: json['Number'],
    );
  }
}