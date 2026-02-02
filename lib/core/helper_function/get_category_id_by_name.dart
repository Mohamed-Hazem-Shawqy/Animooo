 import 'package:animooo/core/entity/get_all_category_entity.dart';

int? getCategoryIdByName(String name, List<GetAllCategoryEntity> categories) {
    try {
      return categories
          .firstWhere((c) => c.name.toLowerCase() == name.toLowerCase())
          .id;
    } catch (_) {
      return null;
    }
  }