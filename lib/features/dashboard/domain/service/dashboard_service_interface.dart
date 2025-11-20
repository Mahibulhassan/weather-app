import 'package:weather_app/Features/dashboard/domain/model/weather_model.dart';

abstract class DashboardServiceInterface {
  Future<WeatherModel> getWeatherDetails({required double lat, required double lon});
}