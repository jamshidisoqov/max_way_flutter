import 'package:max_way_flutter/data/remote/response/ProductModel.dart';
import 'package:max_way_flutter/domain/models/base_model.dart';

class ProductData extends BaseModel {
  Products products;
  int count;
  String categoryId;

  ProductData(
      {required this.products, required this.count, required this.categoryId});
}

class Product extends BaseModel{
  List<ProductData> list;

  Product(this.list);
}
