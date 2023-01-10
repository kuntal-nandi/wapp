class FilterItemModel {
  String sortBy;
  List<BrandModel> brandList;
  List<CategoryModel> categoryList;
  FilterItemModel(
      {required this.brandList,
      required this.sortBy,
      required this.categoryList});
}

class BrandModel {
  String name;
  bool isSelected;
  BrandModel({required this.name, required this.isSelected});
}

class CategoryModel {
  String name;
  bool isSelected;
  CategoryModel({required this.name, required this.isSelected});
}
