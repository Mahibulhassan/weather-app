import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/Features/dashboard/controllers/location_controller.dart';
import 'package:weather_app/Features/dashboard/domain/model/weather_model.dart';
import 'package:weather_app/Features/dashboard/domain/service/dashboard_service_interface.dart';

class DashboardController extends GetxController implements GetxService{
  final DashboardServiceInterface dashboardServiceInterface;
  DashboardController({required this.dashboardServiceInterface});

  WeatherModel? _weatherModel;

  WeatherModel? get weatherModel => _weatherModel;

  void getWeatherDetails() async{
    Position position = await Get.find<LocationController>().getPosition();
    _weatherModel = await dashboardServiceInterface.getWeatherDetails(lat: position.latitude, lon: position.longitude);
    update();

  }

}