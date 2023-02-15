import 'package:max_way_flutter/domain/models/base_model.dart';

class CategoryData extends BaseModel {
  String id;
  String title;
  bool isSelected;

  CategoryData(
      {required this.id, required this.title, required this.isSelected});
}
