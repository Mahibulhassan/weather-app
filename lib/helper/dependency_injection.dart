import 'package:get/get.dart';
import 'package:weather_app/Features/dashboard/controllers/dashboard_controller.dart';
import 'package:weather_app/Features/dashboard/controllers/location_controller.dart';
import 'package:weather_app/Features/dashboard/domain/repository/dashboard_repository_interface.dart';
import 'package:weather_app/Features/dashboard/domain/service/dashboard_service_interface.dart';
import 'package:weather_app/data/remote/api_clint.dart';
import 'package:weather_app/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:weather_app/features/dashboard/domain/service/dashboard_service.dart';
import 'package:weather_app/utils/app_constants.dart';

Future<void> init() async{
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstants.baseUrl));

  ///Repository
  Get.lazyPut(()=> DashboardRepository(apiClient: Get.find()));

  ///Service
  Get.lazyPut(()=> DashboardService(dashboardRepositoryInterface: Get.find()));

  ///Up casting
  DashboardRepositoryInterface dashboardRepositoryInterface = DashboardRepository(apiClient: Get.find());
  Get.lazyPut(()=> dashboardRepositoryInterface);
  DashboardServiceInterface dashboardServiceInterface = DashboardService(dashboardRepositoryInterface: Get.find());
  Get.lazyPut(()=> dashboardServiceInterface);

  ///Controllers
  Get.lazyPut(()=> DashboardController(dashboardServiceInterface: Get.find()));
  Get.lazyPut(()=> LocationController());

}