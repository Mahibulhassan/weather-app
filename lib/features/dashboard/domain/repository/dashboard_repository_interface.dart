
abstract class DashboardRepositoryInterface {
  Future<dynamic> getWeatherDetails({required double lat, required double lon});
}