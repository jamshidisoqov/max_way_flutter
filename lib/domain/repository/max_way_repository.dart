import 'package:max_way_flutter/core/base/model/base_models.dart';
import 'package:max_way_flutter/data/remote/max_way_api.dart';
import 'package:max_way_flutter/data/remote/response/ProductModel.dart';
import 'package:max_way_flutter/di/database_module.dart';

class MaxWayRepository {
  MaxWayApi api;


  MaxWayRepository(this.api);

  Future<BaseResponse<List<Banners>>> getAllBanners() {
    return api.getAllBanners();
  }

  Future<BaseResponse<List<Categories>>> getAllCategoriesAndProducts() {
    return api.getAllCategoriesAndProducts();
  }
}
