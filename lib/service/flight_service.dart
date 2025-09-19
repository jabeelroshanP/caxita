import 'package:caxita/model/flight_model.dart';
import 'package:dio/dio.dart';

class JourneyService {
  final Dio _dio = Dio();

  Future<List<Journey>> fetchJourneys() async {
    try {
      final response = await _dio.get("http://103.214.233.90/result.json");

      if (response.statusCode == 200) {
        final data = response.data as List; 
        return data.map((e) => Journey.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load journeys");
      }
    } catch (e) {
      throw Exception("Error fetching journeys: $e");
    }
  }
}
