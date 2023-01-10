import '../Data Model/filter_item_model.dart';

class FilterDataProvider{
  FilterDataProvider._();
  static final FilterItemModel filterItemModel = FilterItemModel(
      sortBy: 'A-Z',
      brandList: [
        BrandModel(name: 'brand1', isSelected: false),
        BrandModel(name: 'brand2', isSelected: false),
        BrandModel(name: 'brand3', isSelected: false),
        BrandModel(name: 'brand4', isSelected: false),
        BrandModel(name: 'brand5', isSelected: false),
      ],
      categoryList: [
        CategoryModel(name: 'OTC', isSelected: false),
        CategoryModel(name: 'Prescription', isSelected: false),
      ]);
  static List<String> selectedFilters=[];
}