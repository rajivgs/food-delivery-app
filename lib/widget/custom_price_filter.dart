import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/filter/filter_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  //final List<Price> price;
  const CustomPriceFilter({
    Key? key,
    //   required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FilterLoaded) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state.filter.priceFilters
                  .asMap()
                  .entries
                  .map((price) => InkWell(
                        onTap: (() {
                          context.read<FilterBloc>().add(PriceFilterUpdated(
                                priceFilter: state
                                    .filter.priceFilters[price.key]
                                    .copywith(
                                        value: !state.filter
                                            .priceFilters[price.key].value),
                              ));
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                            color: state.filter.priceFilters[price.key].value
                                ? Theme.of(context).primaryColor.withAlpha(100)
                                : const Color.fromARGB(255, 121, 118, 118),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            state.filter.priceFilters[price.key].price.price,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                      ))
                  .toList());
        } else {
          return const Text("Something is wrong!!!");
        }
      },
    );
  }
}
