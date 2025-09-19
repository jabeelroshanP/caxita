class Journey {
  final String journeyId;
  final String journeyIdentifier;
  final int travelDirection;
  final JourneyTime journeyTime;
  final int totalStops;
  final List<FlightItem> flightItems;
  final bool dayChange;
  final bool isConnection;
  final bool isAirportChange;

  Journey({
    required this.journeyId,
    required this.journeyIdentifier,
    required this.travelDirection,
    required this.journeyTime,
    required this.totalStops,
    required this.flightItems,
    required this.dayChange,
    required this.isConnection,
    required this.isAirportChange,
  });

  factory Journey.fromJson(Map<String, dynamic> json) {
    return Journey(
      journeyId: json['JourneyID'],
      journeyIdentifier: json['JourneyIdentifier'],
      travelDirection: json['TravelDirection'],
      journeyTime: JourneyTime.fromJson(json['JourneyTime']),
      totalStops: json['TotalStops'],
      flightItems: (json['FlightItems'] as List)
          .map((e) => FlightItem.fromJson(e))
          .toList(),
      dayChange: json['DayChange'],
      isConnection: json['IsConnection'],
      isAirportChange: json['IsAirportChange'],
    );
  }
}

class JourneyTime {
  final int days;
  final int hours;
  final int minutes;

  JourneyTime({required this.days, required this.hours, required this.minutes});

  factory JourneyTime.fromJson(Map<String, dynamic> json) {
    return JourneyTime(
      days: json['Days'],
      hours: json['Hours'],
      minutes: json['Minutes'],
    );
  }
}

class FlightItem {
  final String legId;
  final String segmentIdentifier;
  final AirportInfo departure;
  final AirportInfo arrival;
  final FlightInfo flightInfo;
  final DurationInfo durationPerLeg;
  final DurationInfo transitTime;
  final int numberOfStops;

  FlightItem({
    required this.legId,
    required this.segmentIdentifier,
    required this.departure,
    required this.arrival,
    required this.flightInfo,
    required this.durationPerLeg,
    required this.transitTime,
    required this.numberOfStops,
  });

  factory FlightItem.fromJson(Map<String, dynamic> json) {
    return FlightItem(
      legId: json['LegID'],
      segmentIdentifier: json['SegmentIdentifier'],
      departure: AirportInfo.fromJson(json['Departure']),
      arrival: AirportInfo.fromJson(json['Arrival']),
      flightInfo: FlightInfo.fromJson(json['FlightInfo']),
      durationPerLeg: DurationInfo.fromJson(json['DurationPerLeg']),
      transitTime: DurationInfo.fromJson(json['TransitTime']),
      numberOfStops: json['NumberOfStops'],
    );
  }
}

class AirportInfo {
  final String airportCode;
  final LocalizedName countryName;
  final LocalizedName cityName;
  final LocalizedName airportName;
  final String dateTime;
  final String terminal;

  AirportInfo({
    required this.airportCode,
    required this.countryName,
    required this.cityName,
    required this.airportName,
    required this.dateTime,
    required this.terminal,
  });

  factory AirportInfo.fromJson(Map<String, dynamic> json) {
    return AirportInfo(
      airportCode: json['AirportCode'],
      countryName: LocalizedName.fromJson(json['CountryName']),
      cityName: LocalizedName.fromJson(json['CityName']),
      airportName: LocalizedName.fromJson(json['AirportName']),
      dateTime: json['DateTime'],
      terminal: json['Terminal'] ?? "",
    );
  }
}

class LocalizedName {
  final String en;
  final String ar;

  LocalizedName({required this.en, required this.ar});

  factory LocalizedName.fromJson(Map<String, dynamic> json) {
    return LocalizedName(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class FlightInfo {
  final LocalizedName name;
  final String code;
  final String number;
  final String cabinClass;
  final String bookingCode;
  final String aircraftName;
  final String equipmentNumber;
  final bool isRedEye;

  FlightInfo({
    required this.name,
    required this.code,
    required this.number,
    required this.cabinClass,
    required this.bookingCode,
    required this.aircraftName,
    required this.equipmentNumber,
    required this.isRedEye,
  });

  factory FlightInfo.fromJson(Map<String, dynamic> json) {
    return FlightInfo(
      name: LocalizedName.fromJson(json['Name']),
      code: json['Code'],
      number: json['Number'],
      cabinClass: json['CabinClass'],
      bookingCode: json['BookingCode'],
      aircraftName: json['AircraftName'],
      equipmentNumber: json['EquipmentNumber'],
      isRedEye: json['IsRedEye'],
    );
  }
}

class DurationInfo {
  final int days;
  final int hours;
  final int minutes;

  DurationInfo({required this.days, required this.hours, required this.minutes});

  factory DurationInfo.fromJson(Map<String, dynamic> json) {
    return DurationInfo(
      days: json['Days'],
      hours: json['Hours'],
      minutes: json['Minutes'],
    );
  }
}
