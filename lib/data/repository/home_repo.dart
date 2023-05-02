import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x_rockket_app/data/api/api_client.dart';
import 'package:space_x_rockket_app/util/app_constants.dart';


class ItemRepo extends GetxService {
  final ApiClient apiClient;
  ItemRepo({required this.apiClient});

  Future<Response> getRocketList() async {
    return await apiClient.getData('${AppConstants.ROCKET_LIST}');
  }
}
