import 'package:get/get.dart';
import 'package:weather_app/Features/dashboard/domain/model/weather_model.dart';
import 'package:weather_app/Features/dashboard/domain/repository/dashboard_repository_interface.dart';
import 'package:weather_app/Features/dashboard/domain/service/dashboard_service_interface.dart';

class DashboardService implements DashboardServiceInterface{
  DashboardRepositoryInterface dashboardRepositoryInterface;
  DashboardService({required this.dashboardRepositoryInterface});

  @override
  Future<WeatherModel> getWeatherDetails({required double lat, required double lon}) async{
    Response response =  await dashboardRepositoryInterface.getWeatherDetails(lat: lat, lon: lon);
    return WeatherModel.fromJson(response.body);
  }


}