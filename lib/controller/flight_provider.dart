import 'package:caxita/model/flight_model.dart';
import 'package:caxita/service/flight_service.dart';
import 'package:flutter/material.dart';
class FlightProvider with ChangeNotifier {
  final FlightService flightService = FlightService();

  List<FlightTripModel> flights = [];
  bool isLoading = false;
  String? errorMessage;


  Future<void> fetchFlights() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await flightService.fetchFlightTrips();
      flights = result;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
