import 'package:caxita/model/flight_model.dart';
import 'package:caxita/service/flight_service.dart';
import 'package:flutter/foundation.dart';

class JourneyProvider with ChangeNotifier {
  final JourneyService _service = JourneyService();

  List<Journey> _journeys = [];
  bool _isLoading = false;
  String? _error;

  List<Journey> get journeys => _journeys;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadJourneys() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _journeys = await _service.fetchJourneys();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
