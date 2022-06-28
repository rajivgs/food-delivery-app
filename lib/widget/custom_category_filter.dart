import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/filter/filter_bloc.dart';
import '../model/model.dart';

class CustomCategoryFilter extends StatelessWidget {
  // final List<Category> categories;
  const CustomCategoryFilter({
    Key? key,
    // required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state is FilterLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is FilterLoaded) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filter.categoryFilters.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 239, 239),
                    borderRadius: BorderRadius.circular(5)),
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.filter.categoryFilters[index].category.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        value: state.filter.categoryFilters[index].value,
                        onChanged: (bool? newValue) {
                          context.read<FilterBloc>().add(CategoryFilterUpdated(
                              categoryFilter:
                                  state.filter.categoryFilters[index].copywith(
                                      value: !state.filter
                                          .categoryFilters[index].value)));
                        },
                      ),
                    )
                  ],
                ),
              );
            });
      } else {
        return const Text("Something is wrong");
      }
    });
  }
}
