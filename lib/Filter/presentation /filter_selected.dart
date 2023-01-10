import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Filter cubit/filter_data_cubit.dart';

class FilterSelected extends StatefulWidget {
  const FilterSelected({Key? key}) : super(key: key);

  @override
  State<FilterSelected> createState() => _FilterSelectedState();
}

class _FilterSelectedState extends State<FilterSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: BlocBuilder<FilterDataCubit, FilterDataState>(
        builder: (context, state) {
          if (state is FilterDataLoaded) {
            return ListView.builder(
              itemCount: state.selectedData.length,
              itemBuilder: (context, i) {
                return i==0 ?  ListTile(
                  title: Text(state.selectedData[i]),
                ) : ListTile(
                  title: Text(state.selectedData[i]),
                  trailing: IconButton(
                          onPressed: () {
                            BlocProvider.of<FilterDataCubit>(context)
                                .deleteFilter(index: i);
                          },
                          icon: const Icon(Icons.close)),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
