import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data Model/filter_item_model.dart';
import '../../Data Provider/data_provider.dart';

part 'filter_data_state.dart';

class FilterDataCubit extends Cubit<FilterDataState> {
  FilterDataCubit() : super(FilterDataInitial());

  void brandValueChange({required int index,required bool value}){
    FilterDataProvider.filterItemModel.brandList[index].isSelected = value;
    emit(FilterDataLoaded(filterItemModel: FilterDataProvider.filterItemModel,
        selectedData: FilterDataProvider.selectedFilters));
  }

  void categoryValueChange({required int index,required bool value}){
    FilterDataProvider.filterItemModel.categoryList[index].isSelected = value;
    emit(FilterDataLoaded(filterItemModel: FilterDataProvider.filterItemModel,
        selectedData: FilterDataProvider.selectedFilters));
  }

  changeSortBy({required String value}){
    FilterDataProvider
        .filterItemModel.sortBy=value;
    emit(FilterDataLoaded(filterItemModel: FilterDataProvider.filterItemModel,
        selectedData: FilterDataProvider.selectedFilters));
  }

  void addFilters(){
    FilterDataProvider.selectedFilters = [];
    FilterDataProvider.selectedFilters.add(FilterDataProvider.filterItemModel.sortBy);
    for(int i=0;i<FilterDataProvider.filterItemModel.brandList.length;i++){
      if(FilterDataProvider.filterItemModel.brandList[i].isSelected==true){
        FilterDataProvider.selectedFilters.add(FilterDataProvider.filterItemModel.brandList[i].name);
      }
      else{}
    }

    for(int i=0;i<FilterDataProvider.filterItemModel.categoryList.length;i++){
      if(FilterDataProvider.filterItemModel.categoryList[i].isSelected==true){
        FilterDataProvider.selectedFilters.add(FilterDataProvider.filterItemModel.categoryList[i].name);
      }
      else{}
    }

    emit(FilterDataLoaded(filterItemModel: FilterDataProvider.filterItemModel,
        selectedData: FilterDataProvider.selectedFilters));
  }

  void deleteFilter({required int index}){
      for(int i=0;i<FilterDataProvider.filterItemModel.brandList.length;i++){
        if(FilterDataProvider.filterItemModel.brandList[i].name==FilterDataProvider.selectedFilters[index]){
          FilterDataProvider.filterItemModel.brandList[i].isSelected=false;
        }
        else{}
      }

      for(int i=0;i<FilterDataProvider.filterItemModel.categoryList.length;i++){
        if(FilterDataProvider.filterItemModel.categoryList[i].name==FilterDataProvider.selectedFilters[index]){
          FilterDataProvider.filterItemModel.categoryList[i].isSelected=false;
        }
        else{}
      }

    FilterDataProvider.selectedFilters.removeAt(index);
    emit(FilterDataLoaded(filterItemModel: FilterDataProvider.filterItemModel,
        selectedData: FilterDataProvider.selectedFilters));

  }

  void resetFilter(){
    FilterDataProvider.filterItemModel.sortBy ='A-Z';
    for(int i=0;i<FilterDataProvider.filterItemModel.brandList.length;i++){
      FilterDataProvider.filterItemModel.brandList[i].isSelected=false;
    }

    for(int i=0;i<FilterDataProvider.filterItemModel.categoryList.length;i++){
      FilterDataProvider.filterItemModel.categoryList[i].isSelected=false;
    }
    emit(FilterDataLoaded(filterItemModel: FilterDataProvider.filterItemModel,
        selectedData: FilterDataProvider.selectedFilters));
  }
}
