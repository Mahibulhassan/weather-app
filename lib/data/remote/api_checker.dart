import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {
      //Get.offAll(()=> const SignInScreen());

    }else if(response.statusCode == 500){
      Get.snackbar('',response.statusText!);
    }else {
      Get.snackbar("",response.statusText!);
    }
  }
}