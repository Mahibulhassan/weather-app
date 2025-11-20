import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Features/dashboard/controllers/dashboard_controller.dart';
import 'package:weather_app/helper/image_helper.dart';
import 'package:weather_app/utils/app_constants.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    Get.find<DashboardController>().getWeatherDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppConstants.appName),
      ),
      body: Center(
        child: GetBuilder<DashboardController>(builder: (dashboardController){
          return dashboardController.weatherModel != null ?
          Column(spacing: 10, mainAxisAlignment: .center, children: [
            Text('City Name: ${dashboardController.weatherModel?.location?.name}'),

            Text('Country Name: ${dashboardController.weatherModel?.location?.country}'),

            Text('Temperature celsius: ${dashboardController.weatherModel?.current?.tempC}'),

            Text('Temperature fahrenheit: ${dashboardController.weatherModel?.current?.tempF}'),

            Text('Weather Condition: ${dashboardController.weatherModel?.current?.condition?.text}'),

            Image.network(ImageHelper.checkImage(dashboardController.weatherModel?.current?.condition?.icon ?? ''), height: 40, width: 40),

            Text('Max Daily Temperature celsius : ${dashboardController.weatherModel?.forecast?.forecastday?[0].day?.maxtempC}'),

            Text('min Daily Temperature celsius : ${dashboardController.weatherModel?.forecast?.forecastday?[0].day?.mintempC}'),

          ]):
          const CircularProgressIndicator();
        }),
      ),
    );
  }
}