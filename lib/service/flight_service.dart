import 'dart:developer';

import 'package:caxita/model/flight_model.dart';
import 'package:dio/dio.dart';

class FlightService {
  final Dio _dio = Dio();

  final String apiUrl = "https://your-api-url.com/endpoint";

  Future<List<FlightTripModel>> fetchFlightTrips() async {
    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final data = response.data['Data']['FlightTrips'] as List;
        return data.map((json) => FlightTripModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load flight trips");
      }
    } catch (e) {
      log("Error fetching flight trips: $e");
      rethrow;
    }
  }
}