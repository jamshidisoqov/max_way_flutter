import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:max_way_flutter/core/base/model/base_models.dart';
import 'package:max_way_flutter/data/remote/response/ProductModel.dart';

class MaxWayApi {

  Dio dio;

  MaxWayApi(this.dio);

  Future<BaseResponse<List<Banners>>> getAllBanners() async {
    List<Banners> banners = [];
    BaseResponse<List<Banners>> result = Success(banners);
    try {
      var response = await dio.get("/_next/data/ch7KmKvJ5azfPmlISTmjb/uz.json");
      int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        result =
            Success(BaseData.fromJson(response.data).pageProps!.banners ?? []);
      } else {
        result = Error(Exception(response.statusMessage));
      }
    } catch (e) {
      result = Error(Exception(e));
    }
    return result;
  }

  Future<BaseResponse<List<Categories>>> getAllCategoriesAndProducts() async {
    List<Categories> categories = [];

    BaseResponse<List<Categories>> result = Success(categories);

    try {
      var response = await dio.get("/_next/data/ch7KmKvJ5azfPmlISTmjb/uz.json");
      int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        result = Success(
            BaseData.fromJson(response.data).pageProps!.categories ?? []);
      } else {
        result = Error(Exception(response.statusMessage));
      }
    } catch (e) {
      result = Error(Exception(e));
    }


    return result;
  }
}
