import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weather_app/apis/api_service.dart';
import 'package:weather_app/models/weather_model.dart' as DataModel;

class HomeController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isLoading = false.obs;
  var list = List<DataModel.WeatherModel>.empty().obs;
  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  void getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    latitude.value = _locationData.latitude!;
    longitude.value = _locationData.longitude!;
    fetchWeatherData();

    print("Latitude : ${latitude}\nLongitude : ${longitude}");
  }

  void fetchWeatherData() async {
    var fetchData = await ApiService.getWeatherData(latitude, longitude);
    if (fetchData != null) {
      list.assign(fetchData);
    }
    print("Weather Data Response -> ${list[0].location.name}");
  }
}
