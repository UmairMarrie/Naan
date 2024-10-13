import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_grocery/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_grocery/common/models/api_response_model.dart';
import 'package:flutter_grocery/features/onboarding/domain/models/onboarding_model.dart';
import 'package:flutter_grocery/localization/app_localization.dart';
import 'package:flutter_grocery/utill/images.dart';

class OnBoardingRepo {
  final DioClient? dioClient;

  OnBoardingRepo({required this.dioClient});

  Future<ApiResponseModel> getOnBoardingList(BuildContext context) async {
    try {
      List<OnBoardingModel> onBoardingList = [
        OnBoardingModel(Images.onBoarding1, 'Select Items'.tr, 'Choose your fresh naan and other favorites from our menu. Add them to your cart with just a tap!'.tr),
        OnBoardingModel(Images.onBoarding2, 'Complete Your Purchase'.tr, 'Finalize your order by providing payment details and confirming your items. Simple and secure checkout!'.tr),
        OnBoardingModel(Images.onBoarding3, 'We bring your order right to your door!'.tr, 'Once your order is processed, we will deliver freshly baked naan directly to you, ensuring a fast and reliable delivery!'.tr),
      ];

      Response response = Response(requestOptions: RequestOptions(path: ''), data: onBoardingList, statusCode: 200);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
