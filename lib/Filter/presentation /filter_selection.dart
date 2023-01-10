import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Bloc/Filter cubit/filter_data_cubit.dart';
import '../Data Provider/data_provider.dart';
import 'filter_selected.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}
// String radioGroupValue='A-Z';
class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text(
            "Filter Page",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            _sortByRadio(context),
            _brandList(context),
            _categoryList(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    BlocProvider.of<FilterDataCubit>(context).addFilters();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const FilterSelected()),);
                  },
                  child: const Text("Apply"),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<FilterDataCubit>(context).resetFilter();
                  },
                  child: const Text("Reset"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

dynamic _brandList(BuildContext context){
  return BlocBuilder<FilterDataCubit, FilterDataState>(
    builder: (context, state) {
      if (state is FilterDataInitial) {
        return Expanded(
            child: ListView.builder(
              itemCount:
              FilterDataProvider.filterItemModel.brandList.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                    value: FilterDataProvider
                        .filterItemModel.brandList[i].isSelected,
                    title: Text(FilterDataProvider
                        .filterItemModel.brandList[i].name),
                    onChanged: (value) {
                      BlocProvider.of<FilterDataCubit>(context)
                          .brandValueChange(
                          index: i, value: value!);
                    });
              },
            ));
      } else if (state is FilterDataLoaded) {
        return Expanded(
            child: ListView.builder(
              itemCount: state.filterItemModel.brandList.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                    value:
                    state.filterItemModel.brandList[i].isSelected,
                    title:
                    Text(state.filterItemModel.brandList[i].name),
                    onChanged: (value) {
                      BlocProvider.of<FilterDataCubit>(context)
                          .brandValueChange(
                          index: i, value: value!);
                    });
              },
            ));
      }
      return Container();
    },
  );
}

dynamic _categoryList(BuildContext context){
  return BlocBuilder<FilterDataCubit, FilterDataState>(
    builder: (context, state) {
      if (state is FilterDataInitial) {
        return Expanded(
            child: ListView.builder(
              itemCount:
              FilterDataProvider.filterItemModel.categoryList
                  .length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                    value: FilterDataProvider
                        .filterItemModel.categoryList[i].isSelected,
                    title: Text(FilterDataProvider
                        .filterItemModel.categoryList[i].name),
                    onChanged: (value) {
                      BlocProvider.of<FilterDataCubit>(context)
                          .categoryValueChange(
                          index: i, value: value!);
                    });
              },
            ));
      }
      else if (state is FilterDataLoaded) {
        return Expanded(
            child: ListView.builder(
              itemCount:
              state.filterItemModel.categoryList.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                    value: state
                        .filterItemModel.categoryList[i].isSelected,
                    title: Text(state
                        .filterItemModel.categoryList[i].name),
                    onChanged: (value) {
                      BlocProvider.of<FilterDataCubit>(context)
                          .categoryValueChange(
                          index: i, value: value!);
                    });
              },
            ));
      }
      return Container();
    },
  );
}

dynamic _sortByRadio(BuildContext context){
  return BlocBuilder<FilterDataCubit, FilterDataState>(
    builder: (context, state) {
      if(state is FilterDataInitial){
        return Column(children: [
          RadioListTile(
              title: const Text('A-Z'),
              value: 'A-Z',
              groupValue: FilterDataProvider
                  .filterItemModel.sortBy,
              onChanged: (value) {
                BlocProvider.of<FilterDataCubit>(context).changeSortBy(value: value.toString());
              }),
          RadioListTile(
              title: const Text('Z-A'),
              value: 'Z-A',
              groupValue: FilterDataProvider
                  .filterItemModel.sortBy,
              onChanged: (value) {
                BlocProvider.of<FilterDataCubit>(context).changeSortBy(value: value.toString());
              }),
        ]);
      }
      return Column(children: [
        RadioListTile(
            title: const Text('A-Z'),
            value: 'A-Z',
            groupValue: FilterDataProvider
                .filterItemModel.sortBy,
            onChanged: (value) {
              BlocProvider.of<FilterDataCubit>(context).changeSortBy(value: value.toString());
            }),
        RadioListTile(
            title: const Text('Z-A'),
            value: 'Z-A',
            groupValue: FilterDataProvider
                .filterItemModel.sortBy,
            onChanged: (value) {
              BlocProvider.of<FilterDataCubit>(context).changeSortBy(value: value.toString());
            }),
      ]);
    },
  );
}
