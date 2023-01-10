part of 'filter_data_cubit.dart';

@immutable
abstract class FilterDataState {}

class FilterDataInitial extends FilterDataState {}
class FilterDataLoaded extends FilterDataState {
  FilterItemModel filterItemModel;
  List<String> selectedData;
  FilterDataLoaded({required this.filterItemModel,required this.selectedData});
}