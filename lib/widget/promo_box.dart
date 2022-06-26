// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shown Promo Images
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //  We will create a custom clippper
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, right: 125),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Free Delivery on Your First 3 Orders.",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                SizedBox(height: 15),
                Text(
                  'Place an order of \$10 or more and the delivery fee is on us.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
