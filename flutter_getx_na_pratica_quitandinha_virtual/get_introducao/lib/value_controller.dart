import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueController extends GetxController {

   RxString definedValue = ''.obs;

   RxBool isLoading = false.obs;

   ValueController({ Key? key });

   Future<void> setValue(String newValue) async {
    isLoading.value = true;
    //update();

    await Future.delayed(const Duration(seconds: 2));

    definedValue.value = newValue;

    isLoading.value = false;
    //update();
    
   }

}