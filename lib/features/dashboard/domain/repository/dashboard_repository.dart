import 'package:get/get_connect/http/src/response/response.dart';
import 'package:weather_app/Features/dashboard/domain/repository/dashboard_repository_interface.dart';
import 'package:weather_app/data/remote/api_clint.dart';
import 'package:weather_app/utils/app_constants.dart';

class DashboardRepository implements DashboardRepositoryInterface{
  final ApiClient apiClient;
  DashboardRepository({required this.apiClient});

  @override
  Future<Response> getWeatherDetails({required double lat, required double lon}) async{
    return await apiClient.getData('${AppConstants.weatherUrl}&q=$lat,$lon&days=1');
  }
}