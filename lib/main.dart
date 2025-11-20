import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/helper/dependency_injection.dart'as di;
import 'package:weather_app/utils/app_constants.dart';
import 'features/dashboard/screens/dashboard_screen.dart';

void main() async{
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          defaultTransition: Transition.fadeIn,
          home: const DashboardScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          builder:(context,child){
            return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(0.95)), child: child!);
          }
      ),
    );
  }
}

