import 'dart:convert';
import 'package:http/http.dart' as http;

class GebetaPlace {
  final String name;
  final double latitude;
  final double longitude;
  final String city;
  final String country;
  final String type;

  const GebetaPlace({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.country,
    required this.type,
  });

  factory GebetaPlace.fromJson(Map<String, dynamic> json) {
    return GebetaPlace(
      name: json['name']?.toString() ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 9.0108,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 38.7613,
      city: json['City']?.toString() ?? 'Addis Ababa',
      country: json['Country']?.toString() ?? 'Ethiopia',
      type: json['type']?.toString() ?? 'place',
    );
  }
}

class GebetaRouteResult {
  final double timeTakenSeconds;
  final double totalDistanceMeters;
  final List<List<double>> polylineCoordinates; // [[lat, lon], ...]
  final String message;

  const GebetaRouteResult({
    required this.timeTakenSeconds,
    required this.totalDistanceMeters,
    required this.polylineCoordinates,
    required this.message,
  });

  int get durationMinutes => (timeTakenSeconds / 60).round();
  double get distanceKm => totalDistanceMeters / 1000.0;
}

class GebetaMapsService {
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21wYW55bmFtZSI6IkVsaWFzIiwiZGVzY3JpcHRpb24iOiIyNWEwMDY0YS1hZDc1LTQ3N2YtODIzZC00NTY1OTU3NTY0ZmIiLCJpZCI6IjBiMzgzZTVhLTRiYWQtNDc1Zi1hZDIwLTQxY2QyOTY2YzYxYSIsImlzc3VlZF9hdCI6MTc5MDc3MTA4OCwiaXNzdWVyIjoiaHR0cHM6Ly9tYXBhcGkuZ2ViZXRhLmFwcCIsImp3dF9pZCI6IjAiLCJzY29wZXMiOlsiTUFUUklYIiwiT05NIiwiVElMRSIsIkRJUkVDVElPTiIsIlRTUyIsIlZSUCIsIlRSQUNLSU5HX0hUVFAiLCJUUkFDS0lOR19TT0NLRVQiLCJHRU9DT0RJTkciLCJSRVZFUlNFR0VPQ09ESU5HIiwiTUFUQ0hJTkciXSwidXNlcm5hbWUiOiJFbGlhcyBEIn0.uQMpCYsjPTu4OEPFciiJW0UfUwV6NAVrw1MC_FxH8zk';

  static const String baseUrl = 'https://mapapi.gebeta.app';
  static const String tilesBaseUrl = 'https://tiles.gebeta.app';

  static String get standardStyleUrl =>
      '$tilesBaseUrl/styles/standard/style.json?apiKey=$apiKey';

  static String get rasterStyleUrl =>
      '$tilesBaseUrl/styles/raster/raster.json?apiKey=$apiKey';

  // Geocoding API: search Addis Ababa places by name
  static Future<List<GebetaPlace>> geocode(String query) async {
    if (query.trim().isEmpty) return [];

    try {
      final encodedQuery = Uri.encodeComponent(query.trim());
      final url = Uri.parse('$baseUrl/api/v1/route/geocoding?name=$encodedQuery&apiKey=$apiKey');
      final response = await http.get(url).timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final list = data['data'] as List?;
        if (list != null) {
          return list.map((item) => GebetaPlace.fromJson(item)).toList();
        }
      }
    } catch (e) {
      // In case of network timeout, caller can handle empty list
    }
    return [];
  }

  // Reverse Geocoding API: get address from coordinates
  static Future<String?> reverseGeocode(double lat, double lon) async {
    try {
      final url = Uri.parse('$baseUrl/api/v1/route/revgeocoding?lat=$lat&lon=$lon&apiKey=$apiKey');
      final response = await http.get(url).timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data']?['name']?.toString() ?? data['data']?['formattedAddress']?.toString();
      }
    } catch (_) {}
    return null;
  }

  // Directions API: calculate optimal route between two points in Addis Ababa
  static Future<GebetaRouteResult?> getDirections({
    required double originLat,
    required double originLon,
    required double destLat,
    required double destLon,
  }) async {
    try {
      final url = Uri.parse(
        '$baseUrl/api/route/direction/?origin=$originLat,$originLon&destination=$destLat,$destLon&apiKey=$apiKey',
      );
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final directionsList = data['direction'] as List?;
        final coords = <List<double>>[];

        if (directionsList != null) {
          for (final item in directionsList) {
            if (item is List && item.length >= 2) {
              coords.add([
                (item[0] as num).toDouble(),
                (item[1] as num).toDouble(),
              ]);
            }
          }
        }

        return GebetaRouteResult(
          timeTakenSeconds: (data['timetaken'] as num?)?.toDouble() ?? 1200.0,
          totalDistanceMeters: (data['totalDistance'] as num?)?.toDouble() ?? 8000.0,
          polylineCoordinates: coords,
          message: data['msg']?.toString() ?? 'Ok',
        );
      }
    } catch (_) {}
    return null;
  }
}
