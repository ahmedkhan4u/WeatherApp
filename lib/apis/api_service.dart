import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class ApiService {
  static final _client = http.Client();
  static final BASE_URL = "http://api.weatherapi.com/v1/";
  static final END_POINT = "current.json";
  static final API_KEY = "42efcb4f0f664e89b5895912222907";
  static Future<WeatherModel?> getWeatherData(lat, lng) async {
    final query = "&q=$lat,$lng&aqi=no";

    final response =
        await _client.get(Uri.parse("$BASE_URL$END_POINT?key=$API_KEY$query"));
    print("Weather Data Response Service => ${response.body}");
    if (response.statusCode == 200) {
      return weatherModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
